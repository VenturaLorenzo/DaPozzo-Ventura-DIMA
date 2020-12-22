import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';

class SportRepository {
  static Future<List<SportModel>> getAllSports() async {
    var db = DatabaseHelper.instance;
    List<Map> rawSports = await db.getAllSports();
    var retVal = new List<SportModel>();

    rawSports.forEach((row) => retVal
        .add(SportModel(id: row['id'], icon: row['icon'], name: row['name'])));

    return retVal;
  }
}
