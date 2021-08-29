import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import '../../global.dart';

class CategoryApi {
  static Future<List<CategoryModel>> getAllCategories() async {
    final url = Globals.baseUrl + "Categories/GetAllCategories";
    final response = await http.get(url);
    final jsonCategory = jsonDecode(response.body).cast<Map<String, dynamic>>();
    //return CategoryModel.fromJson(jsonCategory);
    return jsonCategory
        .map<CategoryModel>((json) => CategoryModel.fromJson(json))
        .toList();
    //return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
    //Devo capire come fare con le Liste
  }

  static Future<List<CategoryModel>> getCategoriesByVendor(int vendorId) async {
    final url = Globals.baseUrl +
        "Categories/GetCategoriesByVendor?vendorId=" +
        vendorId.toString();
    final response = await http.get(url);
    final jsonCategory = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return jsonCategory
        .map<CategoryModel>((json) => CategoryModel.fromJson(json))
        .toList();
  }
}
