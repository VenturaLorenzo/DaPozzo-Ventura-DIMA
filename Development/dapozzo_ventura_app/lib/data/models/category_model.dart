import 'package:flutter/cupertino.dart';

class CategoryModel {
  final int id;
  final String icon;
  final String name;

  CategoryModel({this.icon, this.name,this.id});

  @override
  String toString() {
    // TODO: implement toString
    return name;
  }


}