import 'package:dapozzo_ventura_app/ui/cart_page.dart';
import 'package:dapozzo_ventura_app/ui/home_page.dart';
import 'package:dapozzo_ventura_app/ui/loading_page.dart';
import 'package:dapozzo_ventura_app/ui/product_page.dart';
import 'package:dapozzo_ventura_app/ui/profile_page.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';
import 'package:flutter/material.dart';




void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {

    '/' : (context)=>Loading(),
    '/home': (context)=>Home(),
    '/vendor' : (context)=> Vendor(),
    '/product' : (context)=> Product(),
    '/cart' : (context)=> Cart(),
    '/myprofile' : (context)=> MyProfile(),

  },
));
