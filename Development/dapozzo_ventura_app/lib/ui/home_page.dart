import 'package:dapozzo_ventura_app/blocs/market_place_bloc.dart';
import 'package:dapozzo_ventura_app/events/market_place_event.dart';
import 'package:dapozzo_ventura_app/models/category_model.dart';
import 'package:dapozzo_ventura_app/models/market_place_model.dart';
import 'package:dapozzo_ventura_app/models/sport_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';
import 'package:dapozzo_ventura_app/ui/filter_bar_widget.dart';
import 'package:dapozzo_ventura_app/ui/vendor_list_widget.dart';
import 'package:dapozzo_ventura_app/ui/vendor_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _marketPlaceBloc = MarketPlaceBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageCache.clear();
    _marketPlaceBloc.add(MarketPlaceInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cart");
            },
            icon: Icon(Icons.shopping_cart),
          )
        ],
        title: Text("eQuip"),
      ),
      body: BlocProvider(
        builder: (BuildContext context) => _marketPlaceBloc,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              floating: true,
              expandedHeight: 250,
              pinned: false,
              flexibleSpace: FilterBar(marketPlaceBloc: _marketPlaceBloc),
            ),
            BlocBuilder<MarketPlaceBloc, MarketPlaceState>(
                builder: (context, state) {
              List<Vendor> vendors;
              if (state is MarketPlaceLoadingState) {
                return SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is MarketPlaceInitial) {
                vendors = state.initialResult;
                return SliverList(delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  if (index < vendors.length) {
                    return VendorCard(
                      vendor: vendors[index],
                    );
                  } else {
                    return null;
                  }
                }));
              } else {
                if (state is MarketPlaceSearched) {
                  vendors = state.result;
                  return VendorList(vendors);
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
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _marketPlaceBloc.close();
  }
}
