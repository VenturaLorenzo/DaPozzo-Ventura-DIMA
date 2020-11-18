import 'package:dapozzo_ventura_app/events/vendor_event.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';
import 'package:bloc/bloc.dart';

class VendorBloc extends Bloc<VendorEvent,VendorState>{

  @override
  VendorState get initialState {

    final Vendor initialResult=Vendor.getVendors();
    return VendorStateInitial(initialResult);
  }

  @override
  Stream<VendorState> mapEventToState(VendorEvent event) async* {
    if (event is VendorEventSearch) {
      Vendor result = new Vendor([]);
      result=Vendor.getVendorsWith(event.query);

      yield VendorStateSearched(event.query,result);
    } else {
      if( event is VendorEventReset){
        final Vendor initialResult=Vendor.getVendors();

        yield VendorStateInitial(initialResult);

      }
      else{
        yield VendorStateGeneralError("Unknown Action");
      }
    }
  }
}