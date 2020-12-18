import 'package:dapozzo_ventura_app/ui/pages/cart_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/goods_typology_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/home_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/launch_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/profile_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/settings_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/vendor_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/vendor_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

static Route<dynamic> generateRoute(RouteSettings settings){

  final arg= settings.arguments;

  switch(settings.name){
    case'/launch':
      return MaterialPageRoute(builder: (context)=>LaunchPage());
    case  '/home':
      return MaterialPageRoute(builder: (context)=>Home( categoriesAndSports: settings.arguments,));
    case  '/vendor':
      return MaterialPageRoute(builder: (context)=>VendorPage( vendor: settings.arguments,));
    case  '/goodtypology':
      return MaterialPageRoute(builder: (context)=>GoodTypologyPage(goodTypology:  settings.arguments,));
    case  '/cart':
      return MaterialPageRoute(builder: (context)=>CartPage());
    case  '/vendor_profile':
      return MaterialPageRoute(builder: (context)=>VendorProfilePage());
    case  '/profile':
      return MaterialPageRoute(builder: (context)=>MyProfile());
    case  '/settings':
      return MaterialPageRoute(builder: (context)=>SettingsPage());


  }
}


}