import 'dart:convert';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:http/http.dart' as http;

import '../../global.dart';

class GoodTypologyApi {
  static Future<List<GoodTypologyModel>> getGoodsTypologies(
      List<int> categoryIds, int genderFilter, int vendorId) async {
    final url = Globals.baseUrl +
        "GoodTypologies/GetGoodTypologies?VendorId=" +
        vendorId.toString() +
        "&&Gender=" +
        genderFilter.toString() +
        "&&CategoryIdList=" +
        categoryIds.map((i) => i.toString()).join(",");

    final response = await http.get(url);
    final jsonTypology = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return jsonTypology
        .map<GoodTypologyModel>((json) => GoodTypologyModel.fromJson(json))
        .toList();
  }
}
