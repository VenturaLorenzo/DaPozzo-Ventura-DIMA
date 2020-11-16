import 'package:dapozzo_ventura_app/blocs/market_place_bloc.dart';
import 'package:dapozzo_ventura_app/events/market_place_event.dart';
import 'package:dapozzo_ventura_app/models/market_place_model.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //final MarketPlace marketPlace =ModalRoute.of(context).settings.arguments;

    final MarketPlaceBloc _marketPlaceBloc = MarketPlaceBloc();
    print(_marketPlaceBloc);
    return Scaffold(
      appBar: AppBar(
        title: Text("name"),
      ),
      body: BlocProvider(
        builder: (BuildContext context) => MarketPlaceBloc(),
        child: BlocBuilder<MarketPlaceBloc, MarketPlaceState>(
          builder: (BuildContext context, MarketPlaceState state) {
            if (state is MarketPlaceInitial) {
              return Text(state.initialResult.vendorList.toString());
            } else {
              if (state is MarketPlaceSearched) {
                return Text(state.result.vendorList.toString());
              } else {
                if (state is MarketPlaceGeneralError) {
                  return Text(state.error.toString());
                }
              }
            }
            return Text("ciao");
          },),
      ),

    );
  }
}
