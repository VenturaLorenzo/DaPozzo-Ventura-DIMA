
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:flutter/material.dart';

abstract class GoodTypologyState{}

class GoodTypologyUninitializedState extends GoodTypologyState{

}
class GoodTypologyLoadingState extends GoodTypologyState{


}
class GoodTypologyCurrentState extends GoodTypologyState{
  final List<GoodModel> goods;
  final List<ColorModel> colors;
  final ColorModel currentSearch;
  GoodTypologyCurrentState(this.goods, this.colors, this.currentSearch);

}
class GoodTypologyStateOutOfStock extends GoodTypologyState{

}
class GoodTypologyErrorState extends GoodTypologyState{

}
