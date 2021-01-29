import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoodItem extends StatefulWidget {
  final String image;
final int price;
  const GoodItem({Key key, this.image,this.price}) : super(key: key);

  @override
  _GoodItemState createState() => _GoodItemState();
}

class _GoodItemState extends State<GoodItem> {
bool favourited=false;
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                offset: Offset(4.0, 4.0),
                blurRadius: 5.0,
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      'https://www.laccademiabjj.it/images/Shop/' + widget.image,
                      fit: BoxFit.cover,
                      width: 325,
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  tooltip: 'Increment',
                  icon: Icon(
                    Icons.share,
                  ),
                  color: Colors.black54,
                  iconSize: 30,
                  padding: const EdgeInsets.all(0),
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: Center(
                      child: Text(
                    widget.price.toString()+ '€',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.green,
                        fontSize: 24),
                  )),
                ),
                IconButton(
                  onPressed: () {setState(() {

favourited=!favourited;                  });},
                  tooltip: 'Increment',
                  icon: Icon(
                    (favourited)?Icons.favorite:Icons.favorite_border                 ),
                  color: (favourited)?Colors.red:Colors.black54,
                  iconSize: 30,
                  padding: const EdgeInsets.all(0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
