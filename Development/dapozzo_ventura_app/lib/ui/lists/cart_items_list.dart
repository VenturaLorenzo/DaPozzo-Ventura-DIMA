import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/ui/items/cart_item.dart';
import 'package:flutter/cupertino.dart';

class CartItemList extends StatelessWidget {
  final List<GoodModel> items;
final double height;
  const CartItemList({this.height,Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: items.length,
          itemBuilder: (context, index) {
            print(items[index]);
            return CartItem(height:height/4 ,
              cartGood: items[index],
            );
          }),
    );
  }
}
