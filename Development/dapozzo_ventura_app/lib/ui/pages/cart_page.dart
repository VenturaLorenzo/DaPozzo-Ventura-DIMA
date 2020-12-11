import 'package:dapozzo_ventura_app/blocs/cart_bloc.dart';
import 'package:dapozzo_ventura_app/states/cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RaisedButton(
          child: Text("RETURN"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        BlocBuilder<CartBloc, CartState>(
          bloc: BlocProvider.of<CartBloc>(context),
          builder: (context, state) {
            if (state is CartStateLoading) {
              return CircularProgressIndicator();
            } else {
              if (state is CartCurrentState) {
                return Column(
                  children: state.products.map((product) {
                    return Card(
                      child: Text(product),
                    );
                  }).toList(),
                );
              } else {
                return Text("ERROR RANDOM CART STATE");
              }
            }
          },
        ),
      ],
    ));
  }
}
