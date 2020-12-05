import 'package:cart_test/cart_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_bloc.dart';
import 'product_image_card.dart';

class ProductPage extends StatelessWidget {

  final List<String> productsImages=["ciao1","ciao1","ciao1","ciao1","ciao1","ciao1"];
  @override
  Widget build(BuildContext context) {
    final CartBloc _cartBloc=BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("product"),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text("Add to cart"),onPressed: (){_cartBloc.add(CartAddEvent("prodotto"));},
          ),
          Row(),
          Row(),
          Expanded(child: Column(children:productsImages.map((i){return ProductImageCard();}).toList() )),
        ],
      ),
    );
  }
}
