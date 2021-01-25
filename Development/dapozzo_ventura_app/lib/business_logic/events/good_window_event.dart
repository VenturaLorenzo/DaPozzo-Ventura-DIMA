import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';

class GoodWindowEvent {}

class GoodWindowEventInitialize extends GoodWindowEvent {
  final GoodTypologyModel goodTypology;
  GoodWindowEventInitialize(this.goodTypology);
}

class GoodWindowEventFilterChange extends GoodWindowEvent {
  final ColorModel selectedColor;
  final GoodTypologyModel goodTypology;
  GoodWindowEventFilterChange(this.goodTypology, this.selectedColor);
}

