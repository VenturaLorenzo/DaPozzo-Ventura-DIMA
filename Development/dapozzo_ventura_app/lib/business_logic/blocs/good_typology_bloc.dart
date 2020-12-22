import 'package:dapozzo_ventura_app/business_logic/events/good_typology_event.dart';
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/color_repository.dart';
import 'package:dapozzo_ventura_app/data/repositories/good_repository.dart';
import 'package:dapozzo_ventura_app/states/good_typology_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoodTypologyBloc extends Bloc<GoodTypologyEvent, GoodTypologyState> {
  List<ColorModel> colors = [];
  List<GoodModel> goods = [];
  ColorModel currentSearch;
  @override
  GoodTypologyState get initialState => GoodTypologyUninitializedState();

  @override
  Stream<GoodTypologyState> mapEventToState(GoodTypologyEvent event) async* {
    if (event is GoodTypologyEventInitialize) {
      yield GoodTypologyLoadingState();
      //cerco i color nel database
      colors = await ColorRepository.getGoodTypologyColors(event.goodTypology);
      if(colors.isEmpty){
        yield GoodTypologyStateOutOfStock();
      }else{
      add(GoodTypologyEventSearchGood(colors[0]));}
    } else {
      if (event is GoodTypologyEventSearchGood) {
        yield GoodTypologyLoadingState();
        await Future.delayed(Duration(milliseconds: 500));

        currentSearch = event.color;
        goods = await GoodRepository.getGoodsByColor(currentSearch);
        goods.forEach((element) {print(element);});
        yield GoodTypologyCurrentState(goods, colors, currentSearch);
      } else {
        if (event is GoodTypologyEventClear) {
          currentSearch = null;
          colors = [];
          goods = [];
          yield GoodTypologyUninitializedState();
        }
      }
    }
  }
}
