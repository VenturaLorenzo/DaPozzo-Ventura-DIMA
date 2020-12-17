import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:dapozzo_ventura_app/data/repositories/goods_typology_repository.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';

import '../events/vendor_event.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  List<CategoryModel> categories = new List<CategoryModel>();
  String gender =
      "NONE"; // 'MALE' PER MASCHIO, 'FEMALE' PER FEMMINA, 'NONE' PER ENTRAMBI

  VendorState get initialState => VendorStateLoading();

  @override
  Stream<VendorState> mapEventToState(VendorEvent event) async* {
    final dbHelper = DatabaseHelper.instance;

    if (event is VendorEventInit) {
      print("sto inizializzando la pagina del venditore " + event.vendor.name);
      final List<GoodTypologyModel> allGoodTypologies =await  GoodsTypologyRepository.getGoodsTypologies([],-1);
       //   await dbHelper.queryAllGoodTypologies(event.vendor.name);

      yield VendorStateSearched(allGoodTypologies);
    } else {
      if (event is VendorEventCategorySearch) {
        _updateCategories(event.category);

        final List<GoodTypologyModel> allGoodTypologies =await  GoodsTypologyRepository.getGoodsTypologies([],-1);

        //    await dbHelper.queryAllGoodTypeWith(event.vendor.name, event.query);
        yield VendorStateSearched(allGoodTypologies);
      } else {
        if (event is VendorEventGenderSearch) {
          _updateGender(event.gender);
          final List<GoodTypologyModel> allGoodTypologies =await  GoodsTypologyRepository.getGoodsTypologies([],-1);


          //   await dbHelper.queryAllGoodTypologies(event.vendor.name);
          yield VendorStateSearched(allGoodTypologies);
        } else {
          if (event is VendorEventReset) {
            final List<GoodTypologyModel> allGoodTypologies =await  GoodsTypologyRepository.getGoodsTypologies([],-1);

            yield VendorStateInitial(allGoodTypologies);
          } else {
            yield VendorStateGeneralError("Unknown Action");
          }
        }
      }
    }
  }

  void _updateCategories(CategoryModel category) {
    if (categories.contains(category)) {
      categories.remove(category);
    } else {
      categories.add(category);
    }
    print("sto cercando i venditori con categoria " +
        categories.toString() +
        " e gender " +
        gender);
  }

  void _updateGender(String gender) {
    gender = gender;
    print("sto cercando i venditori con categoria " +
        categories.toString() +
        " e gender " +
        gender);
  }
}
