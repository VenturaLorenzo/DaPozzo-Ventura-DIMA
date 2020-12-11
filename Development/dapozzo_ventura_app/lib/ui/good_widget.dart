import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GoodWidget extends StatelessWidget {
  final String image;

  const GoodWidget({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(16,8,16,8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Colors.blueGrey,
                  offset: Offset(1, 4))
            ],
            // border: Border.all(width: 1, color: Colors.black87),
            borderRadius: BorderRadius.circular(7)),
        child: Column(
          children: [
            Container(height: 180,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7), topRight: Radius.circular(7)),
                  child: FittedBox(fit: BoxFit.fill,child: Image.asset("lib/assets/" + image))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text("Share",
                          style: TextStyle(color: Colors.blue, fontSize: 14)),
                      Container(
                          child: IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                        iconSize: 25,
                        color: Colors.blue,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      Text("Like",
                          style: TextStyle(color: Colors.red, fontSize: 14)),
                      Container(
                          child: IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                        iconSize: 25,
                        color: Colors.red,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
