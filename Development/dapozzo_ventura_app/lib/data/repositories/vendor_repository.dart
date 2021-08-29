import 'package:dapozzo_ventura_app/data/repositories/vendor_api.dart';

import '../models/good_typology_model.dart';
import '../models/vendor_model.dart';
import '../providers/database_helper.dart';
import 'category_repository.dart';

class VendorRepository {
  Future<List<Vendor>> getVendorsByFiters(
      List<int> categories, String text, List<int> sports) async {
    /*var dbHelper = DatabaseHelper.instance;

    List<Map> allVendorRows =
        await dbHelper.getVendorsByCategorySportText(text, categories, sports);
    List<Vendor> retVal = [];

    allVendorRows.forEach((row) {
      retVal.add(Vendor(
        name: row[DatabaseHelper.columnName],
        image: row[DatabaseHelper.columnImage],
        rating: row[DatabaseHelper.columnRating],
        desc: row[DatabaseHelper.columnDescription],
        id: row[DatabaseHelper.columnId],
      ));
    });
    await Future.wait(retVal.map((element) async {
      element.categories =
          await CategoryRepository.getCategoriesByVendor(element.id);
      element.frontImages =
          await FrontImageRepository.getFrontTypologyImages(element.id);
    }));
    return retVal;*/
    return VendorApi.getVendorsByFiters(categories, text, sports);
  }

  static Future<List<Vendor>> getVendor(GoodTypologyModel typology) async {
    /*var dbHelper = DatabaseHelper.instance;

    List<Map> allVendorRows = await dbHelper.getVendor(typology.vendorId);
    List<Vendor> retVal = [];

    allVendorRows.forEach((row) {
      retVal.add(Vendor(
        name: row[DatabaseHelper.columnName],
      ));
    });
    return retVal;*/
    return VendorApi.getVendor(typology);
  }
}
