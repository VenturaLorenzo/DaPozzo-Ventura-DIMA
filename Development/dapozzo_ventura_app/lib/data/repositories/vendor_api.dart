import 'dart:convert';
import 'dart:io';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:http/http.dart' as http;

import '../../global.dart';

class VendorApi {
  static Future<List<Vendor>> getVendor(GoodTypologyModel typology) async {
    final url = Globals.baseUrl +
        "Shops/GetShops?GoodTypologyId=" +
        typology.id.toString();
    final response = await http.get(url);
    final jsonVendor = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return jsonVendor.map<Vendor>((json) => Vendor.fromJson(json)).toList();
  }

  static Future<List<Vendor>> getVendorsByFiters(
      List<int> categories, String text, List<int> sports) async {
    final url = Globals.baseUrl + "Shops/GetShopsByFilters";
    Map<String, dynamic> args = {
      "MatchText": text,
      "Sports": sports,
      "Categories": categories
    };
    var body = json.encode(args);

    final response = await http.post(url,
        body: body, headers: {HttpHeaders.CONTENT_TYPE: "application/json"});
    final jsonVendor = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return jsonVendor.map<Vendor>((json) => Vendor.fromJson(json)).toList();
  }
}
