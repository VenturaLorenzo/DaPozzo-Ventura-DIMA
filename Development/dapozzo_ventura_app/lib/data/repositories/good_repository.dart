import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';

class GoodRepository {
  static Future<GoodModel> getGoodByColorAndTypology(
      ColorModel color, GoodTypologyModel typologyModel) async {
    var db = DatabaseHelper.instance;

//FINIRE DI IMPLEMENTARE
    // var retVal = new List<GoodModel>();

    GoodModel retVal = GoodModel(
        type: typologyModel,
        images: ["image2.jpg"],
        color: color,
        size: "M",
        quantity: 10);

    return retVal;
  }
}
