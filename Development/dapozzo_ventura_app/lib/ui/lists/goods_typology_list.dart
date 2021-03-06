import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../items/good_typology_item.dart';

class GoodTypologyList extends StatelessWidget {
  final List<GoodTypologyModel> goodsTypologies;

  GoodTypologyList({this.goodsTypologies});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: goodsTypologies.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return GoodsTypologyItem(
          itemHeight: MediaQuery.of(context).size.height / 5,
          goodsTypology: goodsTypologies[index],
        );
      },
    ));
  }
}
