import 'package:flutter/material.dart';

import 'color_model.dart';

class GoodModel {

  final ColorModel color;
  final List<String> images;
  final String size;
  final int quantity;

  GoodModel({this.color, this.images, this.size, this.quantity});

@override
  String toString() {
    // TODO: implement toString
    return "GOOD -> color : $color, images : $images, size: $size, quantity: $quantity";
  }

}