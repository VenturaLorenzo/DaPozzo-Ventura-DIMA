import 'dart:convert';
import 'dart:io';
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_image_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:http/http.dart' as http;
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import '../../global.dart';

class GoodImageApi {
  static Future<List<GoodImageModel>> getImages(
      GoodTypologyModel goodTypology, ColorModel color) async {
    final url = Globals.baseUrl + "GoodImages/GetImages";

    Map<String, dynamic> args = {
      "GoodTypologyId": goodTypology.id,
      "ColorId": color.id,
    };
    var body = json.encode(args);

    final response = await http.post(url,
        body: body, headers: {HttpHeaders.CONTENT_TYPE: "application/json"});
    final jsonVendor = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return jsonVendor
        .map<GoodImageModel>((json) => GoodImageModel.fromJson(json))
        .toList();
  }
}
