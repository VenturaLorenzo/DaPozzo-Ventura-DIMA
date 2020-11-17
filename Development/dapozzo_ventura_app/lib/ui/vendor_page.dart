import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vendor extends StatefulWidget {
  @override
  _VendorState createState() => _VendorState();
}

class _VendorState extends State<Vendor> {

  @override
  Widget build(BuildContext context) {
    final String vendor= ModalRoute.of(context).settings.arguments;

    return Scaffold(appBar: AppBar(title: Text(vendor),),);
  }
}
