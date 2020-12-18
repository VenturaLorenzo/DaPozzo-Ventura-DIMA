import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';

class GoodsTypologyRepository {
  static Future<List<GoodTypologyModel>> getGoodsTypologies(
      List<int> categoryIds, int genderFilter) async {
    var db = DatabaseHelper.instance;
    List<Map> rawGoodsTypologies =
        await db.getGoodsTypologies(categoryIds, genderFilter);

    var retVal = new List<GoodTypologyModel>();

    rawGoodsTypologies.forEach((row) => retVal.add(new GoodTypologyModel(
        id: row["id"],
        categoryId: row["goodsCategoryId"],
        gender: row["gender"],
        vendorId: row["vendorId"],
        name: row["name"],
        description: row["description"],
        image: row["image"],
        price: row["price"],
        categoryName: row["categoryName"])));

    return retVal;
  }
}
