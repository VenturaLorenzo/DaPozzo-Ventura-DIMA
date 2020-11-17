import 'package:dapozzo_ventura_app/events/market_place_event.dart';
import 'package:dapozzo_ventura_app/models/market_place_model.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class MarketPlaceBloc extends Bloc<MarketPlaceEvent, MarketPlaceState> {
  @override
  MarketPlaceState get initialState {
    // se entro qui è perche l'ui mi sta richiedendo lo stato iniziale del marketplace
    // cerco nel DB quello che devo cercare: lista negozi, immagini ecc
    //e lo ritorno alla ui
    final MarketPlace initialResult=MarketPlace.getVendors();
   print("sono passato in marketplaceInitial");
    return MarketPlaceInitial(initialResult);
  }

  @override
  Stream<MarketPlaceState> mapEventToState(MarketPlaceEvent event) async* {
    if (event is MarketPlaceSearch) {
      //qui cerco nel database i dati e creo un oggetto marketplace che li contenga
      print("sono passato in marketplace ");
      final MarketPlace result = MarketPlace.getVendorsWith(event.query);// per ora creo un market place vuoto e lo passo come risultato

      yield MarketPlaceSearched(result);
    } else {
      if (event is MarketPlaceEnter) {
        //prendo il parametro che mi viene passato dall'evento
        // (il negozio in cui voglio entrare) con event.shop per esempio
        // e ritorno uno stato MarketplaceInside passandogli come parametro lo shop
        Vendor shop = new Vendor(); //per ora glielo passo vuoto
        yield MarketPlaceInside(shop);
      } else {if( event is MarketPlaceReset){
        final MarketPlace initialResult=MarketPlace.getVendors();

        yield MarketPlaceInitial(initialResult);

      }
      else{
        yield MarketPlaceGeneralError("Unknown Action");
      }}
    }
  }
}
