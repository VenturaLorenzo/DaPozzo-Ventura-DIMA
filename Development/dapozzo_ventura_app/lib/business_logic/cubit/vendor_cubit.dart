import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/goods_typology_repository.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';

class VendorCubit extends Cubit<VendorState>{



  VendorCubit():super(VendorStateLoading());

  Future<void> initialize(List<int> categoryIds,Vendor vendor ) async {
    emit(VendorStateLoading());
    final List<GoodTypologyModel> allGoodTypologies =
    await GoodsTypologyRepository.getGoodsTypologies(categoryIds, -1, vendor.id);
    // allGoodTypologies.forEach((element) {print(element);});
    emit(VendorStateSearched(allGoodTypologies));
  }
  Future<void> search(List<int> categoryIds,int genderFilter,int vendorId) async {
    emit(VendorStateLoading());

    final List<GoodTypologyModel> allGoodTypologies =
    await GoodsTypologyRepository.getGoodsTypologies(categoryIds, genderFilter, vendorId);

    emit(VendorStateSearched(allGoodTypologies));

  }
  Future<void> reset(Vendor vendor) async {
    emit(VendorStateLoading());

    final List<GoodTypologyModel> allGoodTypologies =
    await GoodsTypologyRepository.getGoodsTypologies(
        [], -1, vendor.id);

    emit(VendorStateSearched(allGoodTypologies));

  }

}