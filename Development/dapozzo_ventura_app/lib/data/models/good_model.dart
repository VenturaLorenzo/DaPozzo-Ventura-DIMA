import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:flutter/material.dart';

import 'color_model.dart';

class GoodModel {
  final GoodTypologyModel type;
  final ColorModel color;
  final List<String> images;
  final String size;
   int quantity;

  GoodModel({this.type,this.color, this.images, this.size, this.quantity});
  @override
  bool operator ==(other) {
    return (other is GoodModel)
        && other.type == type
        && other.color == color
         && other.size == size;
  }
@override
  String toString() {
    // TODO: implement toString
    return "GOOD ->  color : $color, images : $images, size: $size, quantity: $quantity";
  }

}