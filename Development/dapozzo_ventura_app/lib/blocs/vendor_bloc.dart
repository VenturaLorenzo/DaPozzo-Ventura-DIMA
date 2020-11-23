import 'package:dapozzo_ventura_app/events/vendor_event.dart';
import 'package:dapozzo_ventura_app/models/product_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';
import 'package:bloc/bloc.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  VendorState get initialState => VendorStateLoading();

  @override
  Stream<VendorState> mapEventToState(VendorEvent event) async* {
    if (event is VendorEventInit) {
      final List<Product> initialResult =
          await Vendor.getProducts(event.vendor);
      yield VendorStateInitial(initialResult);
    } else {
      if (event is VendorEventSearch) {
        List<Product> result =
            await Vendor.getProductsWith(event.vendor, event.query);

        yield VendorStateSearched(event.query, result);
      } else {
        if (event is VendorEventReset) {
          final List<Product> initialResult =
              await Vendor.getProducts(event.vendor);
          yield VendorStateInitial(initialResult);
        } else {
          yield VendorStateGeneralError("Unknown Action");
        }
      }
    }
  }
}
