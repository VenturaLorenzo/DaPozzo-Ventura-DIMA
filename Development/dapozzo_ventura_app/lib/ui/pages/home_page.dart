import 'package:dapozzo_ventura_app/business_logic/blocs/cart_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/blocs/market_place_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/events/market_place_event.dart';
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
  var _marketPlaceBloc;
  List<CategoryModel> categories;
  List<SportModel> sports;

  var _cartBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageCache.clear();
    categories = widget.categoriesAndSports.allCategories;
    sports = widget.categoriesAndSports.allSports;
    _marketPlaceBloc = BlocProvider.of<MarketPlaceBloc>(context);
    _cartBloc = BlocProvider.of<CartBloc>(context);

    _marketPlaceBloc.add(MarketPlaceInit());
  }

  @override
  Widget build(BuildContext context) {
    //  categories= ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: EquipAppBar(
        size: MediaQuery.of(context).size.height / 16,
        title: "eQuip",
      ),
      drawer: EquipNavigatorMenu(navigationTiles: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [],
        )
      ]),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: Container(),
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height / 3.2,
            pinned: false,
            flexibleSpace: FilterBar(
              marketPlaceBloc: _marketPlaceBloc,
              categories: categories,
              sports: sports,
            ),
          ),
          BlocBuilder<MarketPlaceBloc, MarketPlaceState>(
              builder: (context, state) {
            List<Vendor> vendors;
            if (state is MarketPlaceLoadingState) {
              return SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                  ),
                ),
              );
            }
            if (state is MarketPlaceInitial) {
              vendors = state.initialResult;
              return VendorList(vendors, state.categories);
              /*vendors.forEach((element) {print(element.name);});
              return SliverList(delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                if (index < vendors.length) {
                  return VendorItem(
                    vendor: vendors[index],
                  );
                } else {
                  return null;
                }
              }));*/
            } else {
              if (state is MarketPlaceSearched) {
                vendors = state.result;
                return VendorList(vendors, state.categories);
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
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _marketPlaceBloc.close();
  }
}
