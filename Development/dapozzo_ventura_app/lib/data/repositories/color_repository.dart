import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:flutter/material.dart';

class ColorRepository {
  static Future<List<ColorModel>> getGoodTypologyColors(
      GoodTypologyModel goodTypology) async {

    var dbHelper = DatabaseHelper.instance;
    List<ColorModel> colors = [];
    List<Map> rows = await dbHelper.getColorsByTypology(goodTypology.id);
    rows.forEach((row) {
      colors.add(ColorModel(
          name: row[DatabaseHelper.columnName],
          code: row[DatabaseHelper.columnCode]));
    });
    //retVal = [Colors.red, Colors.blue, Colors.yellow];

    return colors;
  }
}
