import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:dapozzo_ventura_app/data/repositories/category_repository.dart';

class VendorRepository {
  static Future<List<Vendor>> getAllVendors() async {
    var dbHelper = DatabaseHelper.instance;

    List<Map> allVendorRow = await dbHelper.getVendors("", []);
    List<Vendor> retVal = [];

    allVendorRow.forEach((row) async {
      retVal.add(Vendor(
        name: row[DatabaseHelper.columnName],
        image: row[DatabaseHelper.columnImage],
        rating: row[DatabaseHelper.columnRating],
        desc: row[DatabaseHelper.columnDescription],
        id: row[DatabaseHelper.columnId],
        //  categories: await  CategoryRepository.getCategoriesByVendor(row[DatabaseHelper.columnId])
      ));
    });
    return retVal;
  }

  static Future<List<Vendor>> getVendorsByTextAndCategory(
      List<int> categories, String text) async {
    var dbHelper = DatabaseHelper.instance;

    List<Map> allVendorRows = await dbHelper.getVendors(text, categories);
    List<Vendor> retVal = [];

    allVendorRows.forEach((row) {
      print(categories);
      retVal.add(Vendor(
        name: row[DatabaseHelper.columnName],
        image: row[DatabaseHelper.columnImage],
        rating: row[DatabaseHelper.columnRating],
        desc: row[DatabaseHelper.columnDescription],
        id: row[DatabaseHelper.columnId],
      ));
    });
    retVal.forEach((element) async {
      element.categories =
          await CategoryRepository.getCategoriesByVendor(element.id);
    });
    return retVal;
  }
}
