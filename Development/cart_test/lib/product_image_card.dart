import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        children: [
          Container(),
          Row(children: [

            Column(children: [Text("share"),],),
            Column(children: [Text("like")],)
          ],),


        ],
      ),
    );
  }
}
