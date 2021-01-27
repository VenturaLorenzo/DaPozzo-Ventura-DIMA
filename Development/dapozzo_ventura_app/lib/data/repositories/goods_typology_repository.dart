import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';

class GoodsTypologyRepository {
   Future<List<GoodTypologyModel>> getGoodsTypologies(
      List<int> categoryIds, int genderFilter, int vendorId) async {
    var db = DatabaseHelper.instance;
    List<Map> rawGoodsTypologies = await db.getGoodsTypologiesByVendor(
        categoryIds, genderFilter, vendorId);

    var retVal = new List<GoodTypologyModel>();

    rawGoodsTypologies.forEach((row) => retVal.add(new GoodTypologyModel(
        id: row[DatabaseHelper.columnId],
        categoryId: row[DatabaseHelper.columnCategoryId],
        gender: row[DatabaseHelper.columnGender],
        vendorId: row[DatabaseHelper.columnVendorId],
        name: row[DatabaseHelper.columnName],
        description: row[DatabaseHelper.columnDescription],
        image: row[DatabaseHelper.columnImage],
        price: row[DatabaseHelper.columnPrice],
        categoryName: row["categoryName"])));

    return retVal;
  }
}
