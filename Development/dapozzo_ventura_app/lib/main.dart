import 'package:dapozzo_ventura_app/blocs/cart_bloc.dart';
import 'package:dapozzo_ventura_app/blocs/market_place_bloc.dart';
import 'package:dapozzo_ventura_app/blocs/vendor_bloc.dart';
import 'package:dapozzo_ventura_app/models/category_model.dart';
import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/ui/pages/cart_page.dart';
import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/ui/pages/goods_typology_page.dart';
import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/ui/pages/home_page.dart';
import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/ui/pages/launch_page.dart';
import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/ui/pages/profile_page.dart';
import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/ui/pages/vendor_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'database_helper.dart';

/*
void main() async{

  print(CategoryModel(Icons.ac_unit,"ciao").name==CategoryModel(Icons.ac_unit,"ciao").name);

}
*/
void main() => runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => MarketPlaceBloc(),
            ),
            BlocProvider(
              create: (BuildContext context) => CartBloc(),
            ),
            BlocProvider(
              create: (BuildContext context) => VendorBloc(),
            )
          ],
          child: MaterialApp(
            initialRoute: '/launch',
            routes: {
              //'/' : (context)=>Loading(),
              '/launch': (context) => LaunchPage(),

              '/home': (context) => Home(),

              '/vendor': (context) => VendorPage(),

              '/goodtypology': (context) => GoodTypologyPage(),

              '/cart': (context) => Cart(),

              '/myprofile': (context) => MyProfile(),
            },
          )),
    );
