import 'dart:ffi';

import 'package:dapozzo_ventura_app/data/models/order_model.dart';
import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';
import 'package:dapozzo_ventura_app/states/shipping_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/models/shippingAddr_model.dart';

class AdressItem extends StatelessWidget {
  final ShippingAddrModel adress;
  final double import;
  final OrderModel order;

  const AdressItem({this.adress, this.import, this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                offset: Offset(8.0, 8.0),
                blurRadius: 5.0,
                spreadRadius: 2,
              ),
            ]),
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, "/remindPage", arguments: {
              "import": import,
              "adress": adress,
              "order": order,
            });
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '${adress.address}, ${adress.appartNum}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        '${adress.streetAddr}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '${adress.comune}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Seleziona',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
