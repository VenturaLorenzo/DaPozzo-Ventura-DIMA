import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_image_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';

abstract class GoodWindowState {}

class GoodWindowInitState extends GoodWindowState {}

class GoodWindowImageBaseState extends GoodWindowState {
  final GoodTypologyModel typology;
  final List<SizeModel> sizes;
  final List<ColorModel> colors;
  final ColorModel currentColor;
  final Vendor vendor;
  GoodWindowImageBaseState(
      this.typology, this.sizes, this.colors, this.currentColor, this.vendor);
}

class GoodWindowImageLoadingState extends GoodWindowImageBaseState {
  GoodWindowImageLoadingState(GoodTypologyModel typology, List<SizeModel> sizes,
      List<ColorModel> colors, ColorModel currentColor, Vendor vendor)
      : super(typology, sizes, colors, currentColor, vendor);
}

class GoodWindowImageLoadedState extends GoodWindowImageBaseState {
  final List<GoodImageModel> goodImages;
  GoodWindowImageLoadedState(
      GoodTypologyModel typology,
      List<SizeModel> sizes,
      List<ColorModel> colors,
      ColorModel currentColor,
      Vendor vendor,
      this.goodImages)
      : super(typology, sizes, colors, currentColor, vendor);
}

class GoodWindowErrorState extends GoodWindowState {}

class GoodWindowImagesNotFuondState extends GoodWindowErrorState {}

class GoodWindowColorsNotFoundState extends GoodWindowErrorState {}
