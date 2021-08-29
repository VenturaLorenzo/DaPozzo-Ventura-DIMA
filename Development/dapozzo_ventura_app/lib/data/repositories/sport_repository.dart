import 'package:dapozzo_ventura_app/data/repositories/sport_api.dart';

import '../models/sport_model.dart';
import '../providers/database_helper.dart';

class SportRepository {
  static Future<List<SportModel>> getAllSports() async {
    /*var db = DatabaseHelper.instance;
    List<Map> rawSports = await db.getAllSports();
    var retVal = new List<SportModel>();

    rawSports.forEach((row) => retVal
        .add(SportModel(id: row['id'], icon: row['icon'], name: row['name'])));

    return retVal;*/
    return SportApi.getAllSports();
  }
}
