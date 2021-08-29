import 'dart:convert';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:http/http.dart' as http;
import '../../global.dart';

class SportApi {
  static Future<List<SportModel>> getAllSports() async {
    final url = Globals.baseUrl + "Sports/GetAllSports";
    final response = await http.get(url);
    final jsonSport = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return jsonSport
        .map<SportModel>((json) => SportModel.fromJson(json))
        .toList();
  }
}
