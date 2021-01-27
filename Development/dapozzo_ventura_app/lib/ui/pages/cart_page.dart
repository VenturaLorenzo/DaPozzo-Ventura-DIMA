import 'package:dapozzo_ventura_app/business_logic/cubit/cart_cubit.dart';
import 'package:dapozzo_ventura_app/states/cart_state.dart';
import 'package:dapozzo_ventura_app/ui/items/cart_item.dart';
import 'package:dapozzo_ventura_app/ui/lists/cart_items_list.dart';
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
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartStateLoading) {
            return CircularProgressIndicator();
          } else {
            if (state is CartCurrentState) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  " Spesa Totale : " +
                                      state.cart.getTotal().toString() +
                                      "€",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54),
                                ),
                              ],
                            ), CartItemList(items: state.cart.getProducts(),)
                          ]

                    ),
                    Column(
                      children: [
                        FlatButton(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 1, 136, 73),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      offset: Offset(4.0, 4.0),
                                      blurRadius: 5.0,
                                      spreadRadius: 1,
                                    ),
                                  ]),
                              child: Center(
                                child: Text(
                                  "COMPRA",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {}),
                      ],
                    )
                  ],
                ),
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
