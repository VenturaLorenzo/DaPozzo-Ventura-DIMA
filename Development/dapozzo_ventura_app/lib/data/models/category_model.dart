import 'package:flutter/cupertino.dart';

class CategoryModel {

  final IconData icon;
  final String name;

  CategoryModel(this.icon, this.name);

  @override
  String toString() {
    // TODO: implement toString
    return name;
  }


}