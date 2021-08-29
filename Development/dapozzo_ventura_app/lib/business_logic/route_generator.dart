import 'package:dapozzo_ventura_app/states/shipping_state.dart';
import 'package:dapozzo_ventura_app/ui/pages/address_registration_page.dart';
import 'package:dapozzo_ventura_app/ui/pages/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dapozzo_ventura_app/ui/pages/paymet_success_page.dart';
import 'package:path/path.dart';

import '../ui/pages/address_page.dart';
import '../ui/pages/cart_page.dart';
import '../ui/pages/good_window_page.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/launch_page.dart';
import '../ui/pages/login_page.dart';
import '../ui/pages/paymet_success_page.dart';
import '../ui/pages/profile_page.dart';
import '../ui/pages/remind_page.dart';
import '../ui/pages/settings_page.dart';
import '../ui/pages/vendor_page.dart';
import '../ui/pages/vendor_profile_page.dart';
import 'cubit/cart_cubit.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case '/launch':
        return MaterialPageRoute(
            settings: settings, builder: (context) => LaunchPage());
      case '/home':
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => Home(
                  categoriesAndSports: settings.arguments,
                ));
      case '/vendor':
        final Map arguments = settings.arguments as Map;
        return MaterialPageRoute(
            settings: settings,
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
        return MaterialPageRoute(
            settings: settings, builder: (context) => CartPage());
      case '/vendor_profile':
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => VendorProfilePage(
                  vendorName: settings.arguments,
                ));
      case '/profile':
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => ProfilePage(
                  userName: settings.arguments,
                ));
      case '/settings':
        return MaterialPageRoute(
            settings: settings, builder: (context) => SettingsPage());
      case '/login':
        return MaterialPageRoute(
            settings: settings, builder: (context) => LoginPage());
      case '/success':
        return MaterialPageRoute(
            settings: settings, builder: (context) => PaymentSuccessPage());
      case '/shipping':
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => AddressPage(
                  import: settings.arguments,
                ));
      case '/remindPage':
        final Map arguments = settings.arguments as Map;
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => RemindPage(
                  import: arguments["import"],
                  adress: arguments["adress"],
                ));
      case '/registration':
        return MaterialPageRoute(
            settings: settings, builder: (context) => RegistrationPage());
      case '/address':
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => AddressRegistrationPage());
    }
  }
}
