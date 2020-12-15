import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/ui/items/vendor_item.dart';
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
            return VendorItem(
              vendor: vendors[index],
            );
          } else {
            return null;
          }
        }));
  }
}
