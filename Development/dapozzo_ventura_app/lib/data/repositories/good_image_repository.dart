import 'package:dapozzo_ventura_app/data/repositories/good_image_api.dart';
import '../models/color_model.dart';
import '../models/good_image_model.dart';
import '../models/good_typology_model.dart';
import '../providers/database_helper.dart';

class GoodImageRepository {
  static Future<List<GoodImageModel>> getImages(
      GoodTypologyModel goodTypology, ColorModel color) async {
    /*var dbHelper = DatabaseHelper.instance;
    List<GoodImageModel> images = [];
    List<Map> rows = await dbHelper.getGoodImagesByTypologyAndColor(
        goodTypology.id, color.id);
    rows.forEach((row) {
      images.add(GoodImageModel(
        id: row[DatabaseHelper.columnId],
        typologyId: row[DatabaseHelper.columnTypologyId],
        colorId: row[DatabaseHelper.columnColor],
        image: row[DatabaseHelper.columnImage],
      ));
    });

    return images;*/
    return GoodImageApi.getImages(goodTypology, color);
  }
}
