import '../models/color_model.dart';
import '../models/good_typology_model.dart';
// import '../providers/database_helper.dart';
import 'color_api.dart';

class ColorRepository {
  static Future<List<ColorModel>> getGoodTypologyColors(
      GoodTypologyModel goodTypology) async {
    /*var dbHelper = DatabaseHelper.instance;
    List<ColorModel> colors = [];
    List<Map> rows = await dbHelper.getColorsByTypology(goodTypology.id);
    rows.forEach((row) {
      colors.add(ColorModel(
          id: row[DatabaseHelper.columnId],
          name: row[DatabaseHelper.columnName],
          code: row[DatabaseHelper.columnCode]));
    });

    return colors;*/
    return ColorApi.getGoodTypologyColors(goodTypology);
  }
}
