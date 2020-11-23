import 'package:dapozzo_ventura_app/events/vendor_event.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';
import 'package:bloc/bloc.dart';

class VendorBloc extends Bloc<VendorEvent,VendorState>{

  @override
  VendorState get initialState {

    final List<String> initialResult=Vendor.getProducts();
    return VendorStateInitial(initialResult);
  }

  @override
  Stream<VendorState> mapEventToState(VendorEvent event) async* {
    if (event is VendorEventSearch) {
      List<String> result = Vendor.getProductsWith(event.query);

      yield VendorStateSearched(event.query,result);
    } else {
      if( event is VendorEventReset){
        final List<String> initialResult=Vendor.getProducts();

        yield VendorStateInitial(initialResult);

      }
      else{
        yield VendorStateGeneralError("Unknown Action");
      }
    }
  }
}