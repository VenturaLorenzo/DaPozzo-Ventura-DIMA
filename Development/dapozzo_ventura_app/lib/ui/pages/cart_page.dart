import 'package:dapozzo_ventura_app/business_logic/cubit/cart_cubit.dart';
import 'package:dapozzo_ventura_app/states/cart_state.dart';
import 'package:dapozzo_ventura_app/ui/items/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back));
        }),

        title: Text("Cart"),
      ),
     body:

      BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartStateLoading) {
            return CircularProgressIndicator();
          } else {
            if (state is CartCurrentState) {
              return Column(
                children: <Widget>[
                  Text(" Totale : "+state.cart.getTotal().toString())]
                    +
                    state.cart.getProducts().map((product) {
                  return CartItem(
                    cartGood: product,
                  );
                }).toList(),
              );
            } else {
              return Text("ERROR RANDOM CART STATE");
            }
          }
        },
      ),
    );
  }
}
