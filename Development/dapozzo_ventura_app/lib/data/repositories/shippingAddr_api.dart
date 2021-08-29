import 'dart:convert';
import 'dart:io';
import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';
import 'package:http/http.dart' as http;
import '../../global.dart';

class ShippingAddrApi {
  static Future<List<ShippingAddrModel>> getAddrByUser(int userId) async {
    final url = Globals.baseUrl +
        "ShippingAddresses/GetAddrByUser?userId=" +
        userId.toString();
    final response = await http.get(url);
    final jsonCategory = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return jsonCategory
        .map<ShippingAddrModel>((json) => ShippingAddrModel.fromJson(json))
        .toList();
  }

  static Future<ShippingAddrModel> newShippingAddr(
      String address,
      String appNum,
      String streetAddress,
      String comune,
      String country,
      String otherInfo,
      int userId) async {
    final url = Globals.baseUrl + "ShippingAddresses/Post";

    Map<String, dynamic> args = {
      "Address": address,
      "AppartamentNumber": appNum,
      "StreetAddr": streetAddress,
      "Comune": comune,
      "Country": country,
      "AddressInfo": otherInfo,
      "UserId": userId,
    };

    var body = json.encode(args);

    try {
      final response = await http.post(url,
          body: body, headers: {HttpHeaders.CONTENT_TYPE: "application/json"});
      Map<String, dynamic> jsonAddressRaw = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw new Exception(jsonAddressRaw["ExceptionMessage"]);
      }

      var id = jsonAddressRaw["Id"] as int;
      var address = jsonAddressRaw["Address"] as String;
      var appartNum = jsonAddressRaw["AppartamentNumber"] as String;
      var otherInfo = jsonAddressRaw["AddressInfo"] as String;
      var comune = jsonAddressRaw["Comune"] as String;
      var userId = jsonAddressRaw["UserId"] as int;
      var country = jsonAddressRaw["Country"] as String;
      var streetAddr = jsonAddressRaw["StreetAddr"] as String;

      return new ShippingAddrModel(
        id: id,
        address: address,
        appartNum: appartNum,
        otherInfo: otherInfo,
        comune: comune,
        userId: userId,
        country: country,
        streetAddr: streetAddr,
      );
    } on Error catch (e) {
      throw e;
    }
  }
}
