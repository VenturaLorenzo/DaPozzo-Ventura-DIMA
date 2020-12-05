import 'package:dapozzo_ventura_app/blocs/cart_bloc.dart';
import 'package:dapozzo_ventura_app/blocs/market_place_bloc.dart';
import 'package:dapozzo_ventura_app/blocs/vendor_bloc.dart';
import 'package:dapozzo_ventura_app/models/market_place_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/ui/cart_page.dart';
import 'package:dapozzo_ventura_app/ui/home_page.dart';
import 'package:dapozzo_ventura_app/ui/product_page.dart';
import 'package:dapozzo_ventura_app/ui/profile_page.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'database_helper.dart';
import 'models/product_model.dart';

/*
void main() async{
  final dbHelper = DatabaseHelper.instance;
  List<Product> products=  await dbHelper.queryAllProduct('vendor1') ;
 products.forEach((element) {print(element.name+ element.image+element.price.toString()); });
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
            initialRoute: '/home',
            routes: {
              //'/' : (context)=>Loading(),

              '/home': (context) => Home(),

              '/vendor': (context) => VendorPage(),

              '/product': (context) => ProductPage(),

              '/cart': (context) => Cart(),

              '/myprofile': (context) => MyProfile(),
            },
          )),
    );
