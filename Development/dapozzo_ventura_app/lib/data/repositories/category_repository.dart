import 'package:dapozzo_ventura_app/data/repositories/category_api.dart';

import '../models/category_model.dart';
import '../providers/database_helper.dart';

class CategoryRepository {
  static Future<List<CategoryModel>> getAllCategories() async {
    /*var db = DatabaseHelper.instance;
    List<Map> rawGoodsCategories = await db.getAllCategories();
    var retVal = new List<CategoryModel>();

    rawGoodsCategories.forEach((row) => retVal.add(
        CategoryModel(id: row["id"], name: row["name"], icon: row["icon"])));*/

    return CategoryApi.getAllCategories();
  }

  static Future<List<CategoryModel>> getCategoriesByVendor(int vendorId) async {
    /*var db = DatabaseHelper.instance;
    List<Map> rawGoodsTypologies = await db.getCategories(vendorId);
    List<CategoryModel> retVal = new List<CategoryModel>();
    rawGoodsTypologies.forEach((row) => retVal.add(
        CategoryModel(id: row["id"], name: row["name"], icon: row["icon"])));*/

    return CategoryApi.getCategoriesByVendor(vendorId);
  }
}
