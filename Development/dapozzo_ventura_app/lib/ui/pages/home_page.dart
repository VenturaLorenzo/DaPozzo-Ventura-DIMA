import 'package:badges/badges.dart';
import 'package:dapozzo_ventura_app/blocs/cart_bloc.dart';
import 'package:dapozzo_ventura_app/blocs/market_place_bloc.dart';
import 'package:dapozzo_ventura_app/events/market_place_event.dart';
import 'package:dapozzo_ventura_app/models/category_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/cart_state.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:dapozzo_ventura_app/ui/filter_bar_widget.dart';
import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/ui/lists/vendor_list_widget.dart';
import 'package:dapozzo_ventura_app/ui/vendor_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _marketPlaceBloc;
  List<CategoryModel> categories;
  var _cartBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageCache.clear();
    _marketPlaceBloc = BlocProvider.of<MarketPlaceBloc>(context);
    _cartBloc = BlocProvider.of<CartBloc>(context);

    _marketPlaceBloc.add(MarketPlaceInit());
  }

  @override
  Widget build(BuildContext context) {
    categories= ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: EquipAppBar(title: "eQuip", ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            expandedHeight: 250,
            pinned: false,
            flexibleSpace: FilterBar(marketPlaceBloc: _marketPlaceBloc,categories: categories),
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
              return SliverList(delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
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
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _marketPlaceBloc.close();
  }
}
