/*import 'package:dapozzo_ventura_app/data/models/order_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/order_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../eQuip_appbar.dart';
import '../eQuip_navigator_menu.dart';

class SendOrderPage extends StatefulWidget {
  final double import;

  const SendOrderPage({
    Key key,
    this.import,
  }) : super(key: key);

  @override
  _SendOrderPageState createState() => _SendOrderPageState();
}

class _SendOrderPageState extends State<SendOrderPage> {
  double pageHeight;
  double pageWidth;
  double adressListHeight;
  double buttonRowHeight;
  OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EquipAppBar(
        withMenu: false,
        title: "eQuip",
      ),
      drawer: EquipNavigatorMenu(navigationTiles: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [],
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
            child: SizedBox(
          height: 60,
          child: FlatButton(
            onPressed: () {
              order.userId = 4;
              order.goodIds[1] = 1;
              order.goodIds[2] = 2;
              OrderRepository.sendOrder(order);
            },
            child: Text("PAGA",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16,
                    fontStyle: FontStyle.normal)),
          ),
        )),
      ),
    );
  }
}*/
