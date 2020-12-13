import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:flutter/material.dart';

class GoodsTypologyItem extends StatelessWidget {
  final GoodTypologyModel goodsTypology;

  const GoodsTypologyItem({this.goodsTypology});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {},
        child: Row(children: [
          SizedBox(
              height: 100,
              width: 120,
              child: Image.asset(
                'lib/assets/image2.jpg',
                fit: BoxFit.contain,
              )),
          Expanded(
            child: SizedBox(
                height: 100,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 20,
                              child: Text(
                                '${goodsTypology.name}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Expanded(
                                      child: Text(
                                        'qui ci va goodsTypology.description',
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ))
                              ]),
                        ]))),
          ),
          SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: Center(
                      child: Text(
                        '${goodsTypology.price}' + '€',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.green,
                            fontSize: 20),
                      )),
                ),
                SizedBox(child: Icon(Icons.arrow_forward_ios))
              ],
            ),
          ),
        ]));
  }
}
