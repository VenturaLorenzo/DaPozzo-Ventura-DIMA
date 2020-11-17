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

    final _marketPlaceBloc = MarketPlaceBloc();

    return Scaffold(
      appBar: AppBar(
        title: Text("name"),
      ),
      body: BlocProvider(
        builder: (BuildContext context) => _marketPlaceBloc,
        child: Column(children: [RaisedButton(onPressed: (){
          _marketPlaceBloc.add(MarketPlaceSearch("ciao"));}
        ,),

          TextField(
            onSubmitted: (typedText) {
              _marketPlaceBloc.add(MarketPlaceSearch(typedText));
            },
            decoration: InputDecoration(labelText: "Search"),
          ),
          Expanded(
            child: BlocBuilder<MarketPlaceBloc, MarketPlaceState>(
              builder: (context, state) {
                if (state is MarketPlaceInitial) {
                  print("sto costruendo markeplaceInitial");

                  List<String> vendors = state.initialResult.vendorsList;
                  return ListView.builder(
                    itemCount: vendors.length,
                    itemBuilder: (context, index) => Card(
                      child: Text(vendors[index]),
                    ),
                  );
                } else {
                  if (state is MarketPlaceSearched) {
                    print("sto costruendo markeplaceSearched");

                    return Text(state.result.vendorsList.toString());
                  } else {
                    if (state is MarketPlaceGeneralError) {
                      return Text(state.error.toString());
                    }
                  }
                }
                return Text("ciao");
              },
            ),
          ),
        ]),
      ),
    );
  }
}
