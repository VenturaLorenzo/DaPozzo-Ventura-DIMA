import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorList extends StatelessWidget {
  final List<String> vendors;

  VendorList(this.vendors);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vendors.length,
      itemBuilder: (context, index) => Card(
        child: RaisedButton(child: Text(vendors[index]),onPressed: (){
          Navigator.pushNamed(context, "/vendor" , arguments: vendors[index]);
        },),
      ),
    );
  }
}
