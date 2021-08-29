import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/ui/items/good_item.dart';
import 'package:flutter/cupertino.dart';

class GoodImagesList extends StatelessWidget {
  final List<String> images;
  final double price;
  final height;
  final GoodTypologyModel good;
  const GoodImagesList(
      {Key key, this.images, this.price, this.height, this.good})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GoodItem(
            good: good,
            height: height,
            image: images[index],
            price: price,
          );
        });
  }
}
