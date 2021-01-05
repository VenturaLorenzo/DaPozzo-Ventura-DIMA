import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:flutter/material.dart';

class GoodRepository {
  static Future<List<GoodModel>> getGoodsByColor(ColorModel color) async {

var db= DatabaseHelper.instance;

//FINIRE DI IMPLEMENTARE
    var retVal = new List<GoodModel>();
    retVal = [
      GoodModel(images: ["image2.jpg"], color: color, size: "M", quantity: 10)
    ];

    return retVal;
  }
}
