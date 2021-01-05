
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:flutter/material.dart';

abstract class GoodTypologyEvent {}

class GoodTypologyEventInitialize extends GoodTypologyEvent {
  final GoodTypologyModel goodTypology;
//final MaterialColor color;
  GoodTypologyEventInitialize(this.goodTypology);
}
class GoodTypologyEventSearchGood extends GoodTypologyEvent {
  final ColorModel color;
  GoodTypologyEventSearchGood(this.color);
}
class GoodTypologyEventClear extends GoodTypologyEvent {

}

