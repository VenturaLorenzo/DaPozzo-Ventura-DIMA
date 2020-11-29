import 'package:dapozzo_ventura_app/events/market_place_event.dart';
import 'package:dapozzo_ventura_app/models/market_place_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/market_place_state.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';
import 'package:bloc/bloc.dart';

class MarketPlaceBloc extends Bloc<MarketPlaceEvent, MarketPlaceState> {
  @override

 MarketPlaceState get initialState => MarketPlaceLoadingState();


  @override
  Stream<MarketPlaceState> mapEventToState(MarketPlaceEvent event) async* {
    if(event is MarketPlaceInit){
      final List<Vendor> initialResult= await MarketPlace.getVendors() ;
      yield MarketPlaceInitial(initialResult);

    }else {
      if (event is MarketPlaceSearch) {
        //qui cerco nel database i dati e creo un oggetto marketplace che li contenga
        print("sono passato in marketplace ");
       final List<Vendor> result = await MarketPlace.getVendorsWith(event.query) ;
        // per ora creo un market place vuoto e lo passo come risultato

        yield MarketPlaceSearched(result, event.query);
      } else {
       /* if (event is MarketPlaceEnter) {
          //prendo il parametro che mi viene passato dall'evento
          // (il negozio in cui voglio entrare) con event.shop per esempio
          // e ritorno uno stato MarketplaceInside passandogli come parametro lo shop
          VendorPage shop = new VendorPage(); //per ora glielo passo vuoto
          yield MarketPlaceInside(shop);
        } else {*/
          if (event is MarketPlaceReset) {
            final List<Vendor> initialResult =await  MarketPlace.getVendors() ;


            yield MarketPlaceInitial(initialResult);
          }
          else {
            yield MarketPlaceGeneralError("Unknown Action");
          }

      }
    }
  }
}
