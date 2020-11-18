import 'package:dapozzo_ventura_app/blocs/market_place_bloc.dart';
import 'package:dapozzo_ventura_app/events/market_place_event.dart';
import 'package:dapozzo_ventura_app/models/market_place_model.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';
import 'package:dapozzo_ventura_app/ui/vendor_list_widget.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {

              Navigator.pushNamed(context, "/cart");
            },
            icon:Icon( Icons.shopping_cart),
          )
        ],
        title: Text("name"),
      ),
      body: BlocProvider(
        builder: (BuildContext context) => _marketPlaceBloc,
        child: Column(children: [
          RaisedButton(
            onPressed: () {
              _marketPlaceBloc.add(MarketPlaceSearch("1"));
            },
            child: Text("Cerca negozi con '1'"),
          ),
          RaisedButton(
            onPressed: () {
              _marketPlaceBloc.add(MarketPlaceReset());
            },
            child: Text("Reset"),
          ),
          TextField(
            onSubmitted: (typedText) {
              _marketPlaceBloc.add(MarketPlaceSearch(typedText));
            },
            decoration: InputDecoration(labelText: "Search"),
          ),
          Expanded(
            child: BlocBuilder<MarketPlaceBloc, MarketPlaceState>(
              builder: (context, state) {
                List<String> vendors;

                if (state is MarketPlaceInitial) {
                  vendors = state.initialResult.vendorsList;
                  return VendorList(vendors);
                } else {
                  if (state is MarketPlaceSearched) {
                    vendors = state.result.vendorsList;
                    print(vendors);
                    return VendorList(vendors);
                  } else {
                    if (state is MarketPlaceGeneralError) {
                      return Text(state.error.toString());
                    }
                  }
                }
                return Text("Error");
              },
            ),
          ),
        ]),
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
