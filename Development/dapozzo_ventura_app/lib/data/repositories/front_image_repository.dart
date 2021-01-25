import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';

class FrontImageRepository {
  static Future<List<String>> getFrontTypologyImages(int vendorId) async {
    var db = DatabaseHelper.instance;

    List<String> images = [];
    List<Map> rowImages = await db.getFrontTypologyImages(vendorId);

    rowImages.forEach((row) {
      images.add(row[DatabaseHelper.columnImage]);
    });

    return images;
  }
}
