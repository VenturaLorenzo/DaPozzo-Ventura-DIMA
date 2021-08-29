import 'package:dapozzo_ventura_app/data/repositories/size_api.dart';

import '../models/color_model.dart';
import '../models/good_typology_model.dart';
import '../models/size_model.dart';
import '../providers/database_helper.dart';

class SizeRepository {
  static Future<List<SizeModel>> getAvailableSizes(
      GoodTypologyModel goodTypology, ColorModel color) async {
    /*var dbHelper = DatabaseHelper.instance;
    List<SizeModel> sizes = [];
    List<Map> rows = await dbHelper.getAvailableSizesByTypologyAndColor(
        goodTypology.id, color.id);
    rows.forEach((row) {
      sizes.add(SizeModel(
        id: row[DatabaseHelper.columnId],
        name: row[DatabaseHelper.columnName],
      ));
    });
    return sizes;*/
    return SizeApi.getAvailableSizes(goodTypology, color);
  }
}
