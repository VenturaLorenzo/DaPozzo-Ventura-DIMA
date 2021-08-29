import 'package:dapozzo_ventura_app/data/repositories/shippingAddr_api.dart';
import '../models/shippingAddr_model.dart';
import '../providers/database_helper.dart';

class ShippingAddrRepository {
  static Future<List<ShippingAddrModel>> getAddrByUser(int userId) async {
    /*var db = DatabaseHelper.instance;
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

    return retVal;*/
    return ShippingAddrApi.getAddrByUser(userId);
  }

  static Future<ShippingAddrModel> newShippingAddr(
      String insAddress,
      String insAppNum,
      String insStreetAddress,
      String insComune,
      String insCountry,
      String insOtherInfo,
      int insUserId) async {
    var retVal = ShippingAddrApi.newShippingAddr(insAddress, insAppNum,
        insStreetAddress, insComune, insCountry, insOtherInfo, insUserId);
    return retVal;
  }
}
