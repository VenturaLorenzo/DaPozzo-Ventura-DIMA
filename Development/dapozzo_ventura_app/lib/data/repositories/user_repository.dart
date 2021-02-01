import 'package:dapozzo_ventura_app/data/models/user_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';

class UserRepository {
  static Future<UserModel> getUserByMail(String insEmail) async {
    var dbHelper = DatabaseHelper.instance;
    List<UserModel> users = [];
    List<Map> rows = await dbHelper.getUser(insEmail);
    rows.forEach((row) {
      users.add(UserModel(
        id: row[DatabaseHelper.columnId],
        email: row[DatabaseHelper.columnEmail],
        name: row[DatabaseHelper.columnName],
        surname: row[DatabaseHelper.columnSurname],
        phone: row[DatabaseHelper.columnPhone],
        image: row[DatabaseHelper.columnImage],
      ));
    });
    if (users.isEmpty) {
      return null;
    }
    return users[0];
  }

  static Future<bool> checkCredential(
      String insEmail, String insPassword) async {
    var dbHelper = DatabaseHelper.instance;
    var retVal = await dbHelper.checkCredential(insEmail, insPassword);
    return retVal;
  }
}
