import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart.dart';
import 'cart_bloc.dart';
import 'cart_event.dart';
import 'product.dart';

void main() => runApp(BlocProvider<CartBloc>(
create: (context) => CartBloc(),
child:MaterialApp(
      initialRoute: '/home',
      routes: {
        //  '/home' : (context)=> MyApp(),
        '/product': (context) => ProductPage(),
        '/home': (context) => MyApp(),
        '/cart': (context) => CartPage(),
      },
    )));

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return  Column(children: [
        RaisedButton(
          child: Text("go to shop"),
          onPressed: () {
            Navigator.pushNamed(context, "/product");
          },
        ),
        RaisedButton(
          child: Text("go to cart"),
          onPressed: () {
            Navigator.pushNamed(context, "/cart");
          },

        ),

      ])
    ;
  }
}
