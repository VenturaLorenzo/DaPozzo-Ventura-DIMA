import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:flutter/material.dart';

class GoodRepository{


  static Future<List<GoodModel>> getGoodsByColor(MaterialColor color) async {
//cerco nel db i color
    var retVal = new List<GoodModel>();

    //converto i colori dal db in colori flutter


    retVal=[GoodModel(images: ["image2.jpg"],color: color,size: "M",quantity: 10)];

    return retVal;
  }



}