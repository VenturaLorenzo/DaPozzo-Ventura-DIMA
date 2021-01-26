import 'package:dapozzo_ventura_app/ui/items/good_item.dart';
import 'package:flutter/cupertino.dart';

class GoodImagesList extends StatelessWidget {
  final List<String> images;
  final int price;
  const GoodImagesList({Key key, this.images,this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GoodItem(
            image: images[index],price: price,
          );
        });
  }
}