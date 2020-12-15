import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';

import '../events/vendor_event.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  List<CategoryModel> categories= new List<CategoryModel>();
  String
      gender="NONE"; // 'MALE' PER MASCHIO, 'FEMALE' PER FEMMINA, 'NONE' PER ENTRAMBI

  VendorState get initialState => VendorStateLoading();

  @override
  Stream<VendorState> mapEventToState(VendorEvent event) async* {
    final dbHelper = DatabaseHelper.instance;

    if (event is VendorEventInit) {
      print("sto inizializzando la pagina del venditore "+ event.vendor.name);
      final List<GoodTypologyModel> allVendors =
          await dbHelper.queryAllGoodTypologies(event.vendor.name);

      yield VendorStateSearched(allVendors);

    } else {
      if (event is VendorEventCategorySearch) {
if(categories.contains(event.category)){
  categories.remove(event.category);
}else{
        categories.add(event.category);}
        print("sto cercando i venditori con categoria "+ categories.toString()+" e gender " + gender);

        List<GoodTypologyModel> searchResult = [
          GoodTypologyModel(price: 10, name: "prodotto", images: ["image2.jpg"])
        ];
        //    await dbHelper.queryAllGoodTypeWith(event.vendor.name, event.query);
        yield VendorStateSearched(searchResult);

      } else {
        if (event is VendorEventGenderSearch) {

          gender = event.gender;
          print("sto cercando i venditori con categoria "+ categories.toString()+" e gender " + gender);

          List<GoodTypologyModel> searchResult = [
            GoodTypologyModel(
                price: 10, name: "prodotto", images: ["image2.jpg"])
          ];
          //   await dbHelper.queryAllGoodTypologies(event.vendor.name);
          yield VendorStateSearched(searchResult);


        } else {
          if (event is VendorEventReset) {

            final List<GoodTypologyModel> allVendors =
                await dbHelper.queryAllGoodTypologies(event.vendor.name);

            yield VendorStateInitial(allVendors);


          } else {

            yield VendorStateGeneralError("Unknown Action");

          }
        }
      }
    }
  }
}
