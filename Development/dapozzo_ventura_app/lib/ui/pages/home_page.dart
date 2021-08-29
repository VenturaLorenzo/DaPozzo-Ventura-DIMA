import 'package:dapozzo_ventura_app/business_logic/cubit/market_place_cubit.dart';
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_navigator_menu.dart';
import 'package:dapozzo_ventura_app/ui/filter_bar_widget.dart';
import 'package:dapozzo_ventura_app/ui/lists/vendor_list.dart';
import 'package:dapozzo_ventura_app/ui/pages/launch_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  final Arguments categoriesAndSports;

  const Home({Key key, this.categoriesAndSports}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MarketPlaceCubit _marketPlaceCubit;
  List<CategoryModel> categories;
  List<SportModel> sports;
  double filterBarHeight = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageCache.clear();
    categories = widget.categoriesAndSports.allCategories;
    sports = widget.categoriesAndSports.allSports;
    _marketPlaceCubit = BlocProvider.of<MarketPlaceCubit>(context);
    _marketPlaceCubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    filterBarHeight = MediaQuery.of(context).size.height / 3;
    filterBarHeight = MediaQuery.of(context).size.height / 3;

    return Scaffold(
      appBar: EquipAppBar(
        withMenu: true,
        title: "eQuip",
      ),
      drawer: EquipNavigatorMenu(navigationTiles: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [],
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Container(
          color: Colors.white38,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                leading: Container(),
                floating: true,
                expandedHeight: filterBarHeight,
                pinned: false,
                flexibleSpace: FilterBar(
                  maxHeight: filterBarHeight,
                  marketPlaceCubit: _marketPlaceCubit,
                  categories: categories,
                  sports: sports,
                ),
              ),
              BlocBuilder<MarketPlaceCubit, MarketPlaceState>(
                  builder: (context, state) {
                List<Vendor> vendors;
                if (state is MarketPlaceLoadingState ||
                    state is MarketPlaceInitial) {
                  return SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.black54),
                      ),
                    ),
                  );
                } else {
                  if (state is MarketPlaceSearched) {
                    vendors = state.result;
                    if (vendors.isNotEmpty) {
                      return VendorList(vendors, state.categories);
                    } else {
                      return SliverList(delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        if (index < 1) {
                          return Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Text(
                              'Nessun Negozio Trovato',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            )),
                          ));
                        } else {
                          return null;
                        }
                      }));
                    }
                  } else {
                    if (state is MarketPlaceGeneralError) {
                      return Text(state.error.toString());
                    }
                  }
                }
                return Text("Error");
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _marketPlaceCubit.close();
  }
}
