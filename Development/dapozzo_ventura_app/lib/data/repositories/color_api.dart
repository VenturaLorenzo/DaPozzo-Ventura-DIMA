import 'dart:convert';
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:http/http.dart' as http;

import '../../global.dart';

class ColorApi {
  static Future<List<ColorModel>> getGoodTypologyColors(
      GoodTypologyModel goodTypology) async {
    final url = Globals.baseUrl +
        "Colors/GetGoodTypologyColors?goodTypologyId=" +
        goodTypology.id.toString();
    final response = await http.get(url);
    final jsonColor = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return jsonColor
        .map<ColorModel>((json) => ColorModel.fromJson(json))
        .toList();
  }
}
