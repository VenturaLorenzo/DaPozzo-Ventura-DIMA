import 'dart:ffi';

import 'package:dapozzo_ventura_app/data/models/order_model.dart';
import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../items/adress_item.dart';

class AddressSelection extends StatelessWidget {
  final List<ShippingAddrModel> adresses;
  final double import;
  final OrderModel order;

  AddressSelection({this.adresses, this.import, this.order});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Text(
            'Scegli indirizzo di spedizione',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: adresses.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return AdressItem(
                adress: adresses[index], import: import, order: order);
          },
        )),
        /*TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("Modifica Indirizzi"), Icon(Icons.edit)],
          ),
        )*/
      ],
    );
  }
}
