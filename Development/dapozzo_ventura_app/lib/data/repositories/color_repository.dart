import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:flutter/material.dart';

class ColorRepository{


  static Future<List<MaterialColor>> getGoodTypologyColors(GoodTypologyModel goodTypology) async {
//cerco nel db i color
    var retVal = new List<MaterialColor>();

    //converto i colori dal db in colori flutter


     retVal=[Colors.red,Colors.blue,Colors.yellow];

     return retVal;
  }



}