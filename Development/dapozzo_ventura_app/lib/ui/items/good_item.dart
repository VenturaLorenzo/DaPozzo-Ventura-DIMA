import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoodItem extends StatefulWidget {
  final String image;
  final int price;
  final double height;

  const GoodItem({Key key, this.image, this.price, this.height})
      : super(key: key);

  @override
  _GoodItemState createState() => _GoodItemState();
}

class _GoodItemState extends State<GoodItem> {
  bool favourited = false;
  double pageWidth;
  double itemHeight;
  double itemWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemHeight = widget.height;
  }

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    itemWidth = pageWidth * 3 / 4;
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
                      'https://www.laccademiabjj.it/images/Shop/' +
                          widget.image,
                      fit: BoxFit.cover,
                      width: pageWidth * 3 / 4,
                    ))),
            Container(
              height: itemHeight / 12,
              width: itemWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: IconButton(
                      onPressed: () {},
                      tooltip: 'Increment',
                      icon: Icon(
                        Icons.share,
                      ),
                      color: Colors.black54,
                      iconSize: itemHeight / 14,
                      padding: const EdgeInsets.all(0),
                    ),
                  ),
                  SizedBox(
                    height: itemHeight / 12,
                    width: itemWidth / 2,
                    child: Center(
                        child: Text(
                      widget.price.toString() + '€',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                          fontSize: itemHeight / (12 * 1.5)),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          favourited = !favourited;
                        });
                      },
                      tooltip: 'Increment',
                      icon: Icon(
                          (favourited) ? Icons.favorite : Icons.favorite_border),
                      color: (favourited) ? Colors.red : Colors.black54,
                      iconSize: itemHeight / 14,
                      padding: const EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
