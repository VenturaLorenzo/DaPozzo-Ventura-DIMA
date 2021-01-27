import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final GoodModel cartGood;

  const CartItem({Key key, this.cartGood}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                offset: Offset(4.0, 4.0),
                blurRadius: 5.0,
                spreadRadius: 1,
              ),
            ]),
        child: FlatButton(
          onPressed: () {
            // print(goodsTypology);
            // Navigator.pushNamed(context, "/goodtypology",
            //     arguments: goodsTypology);
          },
          child: Row(children: [
            SizedBox(
                height: 100,
                width: 120,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2.5),
                      child: Image.network(
                        'https://www.laccademiabjj.it/images/Shop/' +
                            'FelpaLeggeraGrigio3.jpg',
                        fit: BoxFit.cover,
                      ),
                    ))),
            Expanded(
              child: SizedBox(
                  height: 100,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                  child: Text(
                                'LAccademia',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                            Center(
                              child: SizedBox(
                                child: Text(
                                  'Easy',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Column(
                                        children: [Text("Q.ty"), Text("1")]),
                                  ),
                                  Container(
                                    child: Column(
                                        children: [Text("Size"), Text("S")]),
                                  ),
                                ]),
                          ]))),
            ),
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 40,
                    child: Center(
                        child: Text(
                      '10' + '€',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                          fontSize: 20),
                    )),
                  ),
                  SizedBox(
                      child: Icon(
                    Icons.delete,
                    color: Colors.red[400],
                    size: 30,
                  ))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
// return Card(child: Text(cartGood.type.name+ "("+cartGood.color.toString()+")"+"quantity" + cartGood.getQuantity().toString()+"size" + cartGood.size));
