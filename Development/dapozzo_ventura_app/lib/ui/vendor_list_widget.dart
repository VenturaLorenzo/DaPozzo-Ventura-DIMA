import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/ui/vendor_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorList extends StatelessWidget {
  final List<Vendor> vendors;

  VendorList(this.vendors);
  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          if (index < vendors.length) {
            return VendorCard(
              vendor: vendors[index],
            );
          } else {
            return null;
          }
        }));
  }
}
