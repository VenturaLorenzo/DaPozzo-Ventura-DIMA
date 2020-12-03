import 'dart:async';

import 'package:dapozzo_ventura_app/events/market_place_event.dart';
import 'package:dapozzo_ventura_app/models/market_place_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';
import 'package:bloc/bloc.dart';

import '../database_helper.dart';

class MarketPlaceBloc extends Bloc<MarketPlaceEvent, MarketPlaceState> {
  @override
  MarketPlaceState get initialState => MarketPlaceLoadingState();

  @override
  Stream<MarketPlaceState> mapEventToState(MarketPlaceEvent event) async* {
    final dbHelper = DatabaseHelper.instance;

    if (event is MarketPlaceInit) {
      final List<Vendor> initialResult = await dbHelper.queryVendors("", []);
      yield MarketPlaceInitial(initialResult);
    } else {
      if (event is MarketPlaceSearch) {
        yield MarketPlaceLoadingState();
        await Future.delayed(Duration(milliseconds: 500));

        //qui cerco nel database i dati e creo un oggetto marketplace che li contenga
        List<String> splittedQuery = event.query.split('-');

        String name = splittedQuery[0];
        List<String> categories= new List<String>();
        if(splittedQuery[1]!= "") {
         categories = splittedQuery[1].split(",");
          categories = categories.sublist(0, categories.length - 1);
        }else{
          categories=[];
        }
        final List<Vendor> result =
            await dbHelper.queryVendors(name, categories);
        // per ora creo un market place vuoto e lo passo come risultato

        yield MarketPlaceSearched(result);
      } else {

        if (event is MarketPlaceReset) {
          final List<Vendor> initialResult =
              await dbHelper.queryVendors("", []);

          yield MarketPlaceInitial(initialResult);
        } else {
          yield MarketPlaceGeneralError("Unknown Action");
        }
      }
    }
  }
}
