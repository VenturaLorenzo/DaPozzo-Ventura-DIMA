import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/ui/items/cart_item.dart';
import 'package:dapozzo_ventura_app/ui/items/good_item.dart';
import 'package:flutter/cupertino.dart';

class CartItemList extends StatelessWidget {

  final List<GoodModel> items;

  const CartItemList({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 400,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return CartItem(
              cartGood: items[index],
            );
          }),
    );
  }
}