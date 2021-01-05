import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/goods_typology_repository.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';

import '../events/vendor_event.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  VendorState get initialState => VendorStateLoading();

  @override
  Stream<VendorState> mapEventToState(VendorEvent event) async* {
    if (event is VendorEventInit) {
      print("sto inizializzando la pagina del venditore " + event.vendor.name);
      final List<GoodTypologyModel> allGoodTypologies =
          await GoodsTypologyRepository.getGoodsTypologies(
              [], -1, event.vendor.id);
     // allGoodTypologies.forEach((element) {print(element);});
      yield VendorStateSearched(allGoodTypologies);
    } else if (event is VendorEventSearch) {
      final List<GoodTypologyModel> allGoodTypologies =
          await GoodsTypologyRepository.getGoodsTypologies(
              event.categories, event.gender, event.vendorId);

      yield VendorStateSearched(allGoodTypologies);
    } else if (event is VendorEventReset) {
      final List<GoodTypologyModel> allGoodTypologies =
          await GoodsTypologyRepository.getGoodsTypologies(
              [], -1, event.vendor.id);

      yield VendorStateInitial(allGoodTypologies);
    } else {
      yield VendorStateGeneralError("Unknown Action");
    }
  }
}
