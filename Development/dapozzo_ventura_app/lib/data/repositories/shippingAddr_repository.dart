import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';

class ShippingAddrRepository {
  static Future<List<ShippingAddrModel>> getAddrByUser(int userId) async {
    var db = DatabaseHelper.instance;
    List<Map> rawGoodsCategories = await db.getAddrByUser(userId);
    var retVal = new List<ShippingAddrModel>();

    rawGoodsCategories.forEach((row) => retVal.add(ShippingAddrModel(
          id: row[DatabaseHelper.columnId],
          userId: row[DatabaseHelper.columnUserId],
          address: row[DatabaseHelper.columnAddress],
          appartNum: row[DatabaseHelper.columnAppartNum],
          otherInfo: row[DatabaseHelper.columnAddrInfo],
          comune: row[DatabaseHelper.columnComune],
          country: row[DatabaseHelper.columnCountry],
          cap: row[DatabaseHelper.columnStreetAddr],
        )));

    return retVal;
  }
}
