import 'dart:async';
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
  double pageHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemHeight = widget.height;
  }

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;
    var borderRad = 20.0;

    itemWidth = pageWidth * 8 / 10;
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
            borderRadius: BorderRadius.circular(borderRad)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(borderRad),
                        topRight: Radius.circular(borderRad)),
                    child: Image.network(
                      'https://www.laccademiabjj.it/images/Shop/' +
                          widget.image,
                      fit: BoxFit.cover,
                      width: pageWidth * 9 / 10,
                    ))),
            Container(
              height: itemHeight / 8,
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
                      iconSize: itemHeight / 12,
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
                        if (favourited == false) {
                          _showPopup("Added to favourites", Colors.blueAccent,
                              Icons.favorite, Colors.blueAccent);
                        }
                        setState(() {
                          favourited = !favourited;
                        });
                      },
                      tooltip: 'Increment',
                      icon: Icon((favourited)
                          ? Icons.favorite
                          : Icons.favorite_border),
                      color: (favourited) ? Colors.red : Colors.black54,
                      iconSize: itemHeight / 12,
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

  Future<void> _showPopup(
      String text, Color textColor, IconData icon, Color iconColor) async {
    Timer timer = Timer(Duration(milliseconds: 2000), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
    return showDialog<void>(
      barrierColor: Colors.lightGreen.withOpacity(0.02),
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 2,
          backgroundColor: Colors.lightBlueAccent.withOpacity(0.80),
          title: Column(children: [
            Text(
              text,
              style: TextStyle(fontSize: pageHeight / 40, color: textColor),
            ),
            Icon(
              icon,
              color: iconColor,
              size: pageHeight / 15,
            ),
          ]),
        );
      },
    ).then((value) {
      timer?.cancel();
      timer = null;
    });
  }
}
