import 'dart:ffi';


import 'category_model.dart';

class Vendor {
  final String name;
  final String desc;
  final List<String> images;
  final List<CategoryModel> categories;
  final double rating;


  Vendor({this.name, this.desc, this.images,this.categories,this.rating});

}
