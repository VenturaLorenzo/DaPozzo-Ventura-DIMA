
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:flutter/material.dart';

import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_image_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';

abstract class GoodWindowState {}

class GoodWindowInitState extends GoodWindowState {}

class GoodWindowImageBaseState extends GoodWindowState {
  final GoodTypologyModel typology;
  final List<SizeModel> sizes;
  final List<ColorModel> colors;
  final ColorModel currentColor;
  GoodWindowImageBaseState(
      this.typology, this.sizes, this.colors, this.currentColor);
}

class GoodWindowImageLoadingState extends GoodWindowImageBaseState {
  GoodWindowImageLoadingState(GoodTypologyModel typology, List<SizeModel> sizes,
      List<ColorModel> colors, ColorModel currentColor)
      : super(typology, sizes, colors, currentColor);
}

class GoodWindowImageLoadedState extends GoodWindowImageBaseState {
  final List<GoodImageModel> goodImages;
  GoodWindowImageLoadedState(GoodTypologyModel typology, List<SizeModel> sizes,
      List<ColorModel> colors, ColorModel currentColor, this.goodImages)
      : super(typology, sizes, colors, currentColor);
}

class GoodWindowErrorState extends GoodWindowState {}

class GoodWindowImagesNotFuondState extends GoodWindowErrorState {}

class GoodWindowColorsNotFoundState extends GoodWindowErrorState {}
