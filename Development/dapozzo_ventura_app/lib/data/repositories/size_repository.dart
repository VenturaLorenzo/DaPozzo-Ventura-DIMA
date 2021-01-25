import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';

class SizeRepository {
  static Future<List<SizeModel>> getAvailableSizes(
      GoodTypologyModel goodTypology, ColorModel color) async {
    var dbHelper = DatabaseHelper.instance;
    List<SizeModel> sizes = [];
    List<Map> rows = await dbHelper.getAvailableSizesByTypologyAndColor(
        goodTypology.id, color.id);
    rows.forEach((row) {
      sizes.add(SizeModel(
        id: row[DatabaseHelper.columnId],
        name: row[DatabaseHelper.columnName],
      ));
    });
    return sizes;
  }
}