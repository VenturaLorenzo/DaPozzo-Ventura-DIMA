import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/ui/cart_page.dart';
import 'package:dapozzo_ventura_app/ui/home_page.dart';
import 'package:dapozzo_ventura_app/ui/product_page.dart';
import 'package:dapozzo_ventura_app/ui/profile_page.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';
import 'package:flutter/material.dart';

import 'database_helper.dart';
/*
void main() async{
  final dbHelper = DatabaseHelper.instance;
final List<Vendor> allerow = await dbHelper.queryVendorsWith('2');
 allerow.forEach((element) {print(element.name); });
}
*/
void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {

    //'/' : (context)=>Loading(),
    '/home': (context)=>Home(),
    '/vendor' : (context)=> VendorPage(),
    '/product' : (context)=> ProductPage(),
    '/cart' : (context)=> Cart(),
    '/myprofile' : (context)=> MyProfile(),

  },
));
