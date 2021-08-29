import 'package:bloc/bloc.dart';

import '../../data/models/good_typology_model.dart';
import '../../data/models/vendor_model.dart';
import '../../data/repositories/goods_typology_repository.dart';
import '../../states/vendor_state.dart';

class VendorCubit extends Cubit<VendorState>{

  GoodsTypologyRepository _goodsTypologyRepository;

  VendorCubit(this._goodsTypologyRepository):super(VendorStateInitial());

  Future<void> initialize(List<int> categoryIds,Vendor vendor ) async {
    emit(VendorStateLoading());
    final List<GoodTypologyModel> allGoodTypologies =
    await _goodsTypologyRepository.getGoodsTypologies(categoryIds, -1, vendor.id);
    emit(VendorStateSearched(allGoodTypologies));
  }
  Future<void> search(List<int> categoryIds,int genderFilter,int vendorId) async {
    emit(VendorStateLoading());

    final List<GoodTypologyModel> allGoodTypologies =
    await _goodsTypologyRepository.getGoodsTypologies(categoryIds, genderFilter, vendorId);

    emit(VendorStateSearched(allGoodTypologies));

  }
  Future<void> restore() async {
    emit(VendorStateInitial());



  }

}