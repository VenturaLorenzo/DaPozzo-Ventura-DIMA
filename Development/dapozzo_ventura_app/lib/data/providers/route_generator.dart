import 'package:dapozzo_ventura_app/ui/pages/cart_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/goods_typology_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/home_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/launch_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/profile_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/vendor_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

static Route<dynamic> generateRoute(RouteSettings settings){

  final arg= settings.arguments;

  switch(settings.name){
    case'/launch':
      return MaterialPageRoute(builder: (context)=>LaunchPage());
    case  '/home':
      return MaterialPageRoute(builder: (context)=>Home( categories: settings.arguments,));
    case  '/vendor':
      return MaterialPageRoute(builder: (context)=>VendorPage( vendor: settings.arguments,));
    case  '/goodtypology':
      return MaterialPageRoute(builder: (context)=>GoodTypologyPage());
    case  '/cart':
      return MaterialPageRoute(builder: (context)=>CartPage());
    case  '/profile':
      return MaterialPageRoute(builder: (context)=>MyProfile());


  }
}


}