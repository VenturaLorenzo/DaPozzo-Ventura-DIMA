import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:dapozzo_ventura_app/data/repositories/category_repository.dart';
import 'package:dapozzo_ventura_app/data/repositories/front_image_repository.dart';

class VendorRepository {
  static Future<List<Vendor>> getVendorsByFiters(
      List<int> categories, String text, List<int> sports) async {
    var dbHelper = DatabaseHelper.instance;

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
    return retVal;
  }
}
