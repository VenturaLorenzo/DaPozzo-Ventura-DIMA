import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';

class SizeRepository {
  static Future<List<SizeModel>> getGoodTypologySizes(
      GoodTypologyModel goodTypology) async {
   var dbHelper = DatabaseHelper.instance;
    List<SizeModel> sizes = [];
    sizes.add(SizeModel(name: "Medium",id: 1));
   sizes.add(SizeModel(name: "Large",id: 2));
   sizes.add(SizeModel(name: "Small",id: 3));
return sizes;
    /*List<Map> rows = await dbHelper.getSizesByTypology(goodTypology.id);
    rows.forEach((row) {
      sizes.add(SizeModel(
        id: row[DatabaseHelper.columnId],
        name: row[DatabaseHelper.columnName],
      ));
    });*/

  }
}
