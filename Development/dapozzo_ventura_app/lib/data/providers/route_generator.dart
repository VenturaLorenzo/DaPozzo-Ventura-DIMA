import 'package:dapozzo_ventura_app/ui/pages/cart_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/good_window_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/home_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/launch_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/login_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/profile_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/settings_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/vendor_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/vendor_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case '/launch':
        return MaterialPageRoute(settings: settings,builder: (context) => LaunchPage());
      case '/home':
        return MaterialPageRoute(settings: settings,
            builder: (context) => Home(
                  categoriesAndSports: settings.arguments,
                ));
      case '/vendor':
        final Map arguments = settings.arguments as Map;
        return MaterialPageRoute(settings: settings,
            builder: (context) => VendorPage(
                  vendor: arguments["vendor"],
                  preselectedCategories: arguments["preselectedCategories"],
                ));
      case '/goodtypology':
        return MaterialPageRoute(
            builder: (context) => GoodWindowPage(
                  goodTypology: settings.arguments,
                ));
      case '/cart':
        return MaterialPageRoute( settings: settings,  builder: (context) => CartPage());
      case '/vendor_profile':
        return MaterialPageRoute(settings: settings,builder: (context) => VendorProfilePage(vendorName: settings.arguments,));
      case '/profile':
        return MaterialPageRoute(settings: settings,builder: (context) => ProfilePage(userName: settings.arguments,));
      case '/settings':
        return MaterialPageRoute(settings: settings,builder: (context) => SettingsPage());
      case '/login':
        return MaterialPageRoute(settings: settings,builder: (context) => LoginPage());
    }
  }
}
