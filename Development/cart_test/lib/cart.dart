import 'package:cart_test/cart_bloc.dart';
import 'package:cart_test/cart_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_state.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  @override
  Widget build(BuildContext context) {
    final  _cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("cart"),
        ),
        body: Column(
          children: [RaisedButton(onPressed: (){_cartBloc.add(CartGetEvent());},),
            BlocBuilder<CartBloc,CartState>(

                    builder: (context, state) {

                      if(state is CartStateLoading){
                        return CircularProgressIndicator();
                      }else{
                      if(state is CartCurrentState)
                        {
                          return Column(children: state.products.map((e) => Text(e)).toList());
                        }}
                      return Text("Errror");
                    }),
          ],
        ));
  }
}
