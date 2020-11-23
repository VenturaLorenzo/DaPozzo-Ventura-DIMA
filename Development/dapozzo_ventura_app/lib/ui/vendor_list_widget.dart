import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorList extends StatelessWidget {
  final List<Vendor> vendors;

  VendorList(this.vendors);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vendors.length,
      itemBuilder: (context, index) => Card(
        child: RaisedButton(child: Text(vendors[index].name),onPressed: (){
          Navigator.pushNamed(context, "/vendor" , arguments: vendors[index]);
        },),
      ),
    );
  }
}
