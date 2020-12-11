import 'package:flutter/cupertino.dart';

import '../good_widget.dart';

class GoodImagesList extends StatelessWidget {
  final List<String> images;

  const GoodImagesList({Key key, this.images}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index){ return GoodWidget(image: images[index],);}
    );
    return Column(children: images.map((image) {

      return GoodWidget(image: image,);

    }).toList(),);
  }
}
