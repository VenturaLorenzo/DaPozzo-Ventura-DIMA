import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoodItem extends StatelessWidget {
  final String image;

  const GoodItem({Key key, this.image}) : super(key: key);

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
                    child: Image.asset(
                      "lib/assets/" + image,
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
                    '25' + '€',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.green,
                        fontSize: 24),
                  )),
                ),
                IconButton(
                  onPressed: () {},
                  tooltip: 'Increment',
                  icon: Icon(
                    Icons.favorite,
                  ),
                  color: Colors.black54,
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
