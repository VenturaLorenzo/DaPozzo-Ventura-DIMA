import 'dart:ffi';

import 'package:dapozzo_ventura_app/models/product_model.dart';

import '../database_helper.dart';

class Vendor {
  final String name;
  final String desc;
  final List<String> images;
  final List<String> categories;
  final double rating;


  Vendor({this.name, this.desc, this.images,this.categories,this.rating});

  static Future<List<Product>> getProducts(Vendor vendor) async {
    //prendo i negozi dal database
    final dbHelper = DatabaseHelper.instance;

    List<Product> products = await dbHelper.queryAllProduct(vendor.name);
    return products;
  }

  static Future<List<Product>> getProductsWith(
      Vendor vendor, String query) async {
    //prendo i negozi dal database
    final dbHelper = DatabaseHelper.instance;

    List<Product> products =
        await dbHelper.queryAllProductWith(vendor.name, query);
    return products;

    //Vendor(vendors.where((element) => element.contains(query)).toList());
  }
}
