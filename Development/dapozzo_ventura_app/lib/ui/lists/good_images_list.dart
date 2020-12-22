import 'package:dapozzo_ventura_app/ui/items/good_item.dart';
import 'package:flutter/cupertino.dart';

class GoodImagesList extends StatelessWidget {
  final List<String> images;

  const GoodImagesList({Key key, this.images}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GoodItem(
            image: images[index],
          );
        });
    // return Column(
    //   children: images.map((image) {
    //     return GoodItem(
    //       image: image,
    //     );
    //   }).toList(),
    // );
  }
}
