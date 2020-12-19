import 'package:badges/badges.dart';
import 'package:dapozzo_ventura_app/business_logic/blocs/cart_bloc.dart';
import 'package:dapozzo_ventura_app/states/cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
        icon: Icon(Icons.shopping_cart),
      ),
      BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartCurrentState) {
          return Badge(
            toAnimate: false,
            shape: BadgeShape.square,
            animationType: BadgeAnimationType.scale	,
            badgeColor: Colors.red,
            borderRadius: BorderRadius.circular(8),
            badgeContent:
            Text(state.products.length.toString(), style: TextStyle(color: Colors.white)),
          );
        } else {
          return Text("ERROR");
        }
      }),
    ]);
  }
}
