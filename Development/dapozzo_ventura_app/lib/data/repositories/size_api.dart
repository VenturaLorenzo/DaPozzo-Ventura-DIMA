import 'dart:convert';
import 'dart:io';
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../global.dart';

class SizeApi {
  static Future<List<SizeModel>> getAvailableSizes(
      GoodTypologyModel goodTypology, ColorModel color) async {
    final url = Globals.baseUrl + "Sizes/GetAvailableSizes";
    Map<String, dynamic> args = {
      "GoodTypologyId": goodTypology.id,
      "ColorId": color.id,
    };
    var body = json.encode(args);

    final response = await http.post(url,
        body: body, headers: {HttpHeaders.CONTENT_TYPE: "application/json"});
    final jsonVendor = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return jsonVendor
        .map<SizeModel>((json) => SizeModel.fromJson(json))
        .toList();
  }
}
