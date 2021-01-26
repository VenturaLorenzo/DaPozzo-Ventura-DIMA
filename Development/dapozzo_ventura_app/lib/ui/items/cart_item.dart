import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
   final GoodModel cartGood;

  const CartItem({Key key, this.cartGood}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(child: Text(cartGood.type.name+ "("+cartGood.color.toString()+")"+"quantity" + cartGood.getQuantity().toString()+"size" + cartGood.size));
  }
}
