import 'package:dapozzo_ventura_app/ui/cart_page.dart';
import 'package:dapozzo_ventura_app/ui/home_page.dart';
import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/inutilizzati/loading_page.dart';
import 'package:dapozzo_ventura_app/ui/product_page.dart';
import 'package:dapozzo_ventura_app/ui/profile_page.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {

    //'/' : (context)=>Loading(),
    '/home': (context)=>Home(),
    '/vendor' : (context)=> VendorPage(),
    '/product' : (context)=> Product(),
    '/cart' : (context)=> Cart(),
    '/myprofile' : (context)=> MyProfile(),

  },
));
