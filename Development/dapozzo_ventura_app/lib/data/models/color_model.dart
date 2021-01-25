import 'package:flutter/cupertino.dart';

class ColorModel {
  final int id;
  final String name;
  final String code;

  ColorModel({this.name, this.code,this.id});
  @override
  String toString() {
    // TODO: implement toString
    return name;
  }
  @override
  bool operator ==( other) {
    // TODO: implement ==
    return ( other is ColorModel) && other.name==name;
  }
}
