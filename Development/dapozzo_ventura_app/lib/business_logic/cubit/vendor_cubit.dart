import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/goods_typology_repository.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';

class VendorCubit extends Cubit<VendorState>{

  GoodsTypologyRepository _goodsTypologyRepository;

  VendorCubit(this._goodsTypologyRepository):super(VendorStateInitial());

  Future<void> initialize(List<int> categoryIds,Vendor vendor ) async {
    emit(VendorStateLoading());
    final List<GoodTypologyModel> allGoodTypologies =
    await _goodsTypologyRepository.getGoodsTypologies(categoryIds, -1, vendor.id);
    // allGoodTypologies.forEach((element) {print(element);});
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