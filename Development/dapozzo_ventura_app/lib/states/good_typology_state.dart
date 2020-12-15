
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:flutter/material.dart';

abstract class GoodTypologyState{}

class GoodTypologyUninitializedState extends GoodTypologyState{

}
class GoodTypologyLoadingState extends GoodTypologyState{


}
class GoodTypologyCurrentState extends GoodTypologyState{
  final List<GoodModel> goods;
  final List<MaterialColor> colors;
  final MaterialColor currentSearch;
  GoodTypologyCurrentState(this.goods, this.colors, this.currentSearch);

}
class GoodTypologyErrorState extends GoodTypologyState{

}
