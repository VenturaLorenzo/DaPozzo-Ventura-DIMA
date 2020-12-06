import 'dart:ffi';

import 'package:dapozzo_ventura_app/models/good_typology_model.dart';

import '../database_helper.dart';

class Vendor {
  final String name;
  final String desc;
  final List<String> images;
  final List<String> categories;
  final double rating;


  Vendor({this.name, this.desc, this.images,this.categories,this.rating});
/*
  static Future<List<GoodTypology>> getGoodTypologies(Vendor vendor) async {
    //prendo i negozi dal database
    final dbHelper = DatabaseHelper.instance;

    List<GoodTypology> goodTypologies = await dbHelper.queryAllGoodTypologies(vendor.name);
    return goodTypologies;
  }

  static Future<List<GoodTypology>> getGoodTypologysWith(
      Vendor vendor, String query) async {
    //prendo i negozi dal database
    final dbHelper = DatabaseHelper.instance;
print(vendor.name);
    print(query);
    List<GoodTypology> goodTypologies =
        await dbHelper.queryAllGoodTypeWith(vendor.name, query);
    return goodTypologies;

    //Vendor(vendors.where((element) => element.contains(query)).toList());
  }

 */
}
