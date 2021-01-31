import 'package:dapozzo_ventura_app/business_logic/cubit/cart_cubit.dart';
import 'package:dapozzo_ventura_app/states/cart_state.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:dapozzo_ventura_app/ui/lists/cart_items_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double pageHeight;
  double totalHeight;
  double itemListHeight;
  double buttonsHeight;

  @override
  Widget build(BuildContext context) {
    pageHeight = MediaQuery.of(context).size.height;
    totalHeight = pageHeight / 9;
    itemListHeight = pageHeight * 2 / 3;
    buttonsHeight = pageHeight / 9;
    return Scaffold(
      appBar: EquipAppBar(
        withMenu: false,
        title: "Cart",
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartStateLoading) {
            return CircularProgressIndicator();
          } else {
            if (state is CartCurrentState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: totalHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: totalHeight * 2 / 3,
                          child: Center(
                            child: Text(
                              " Spesa Totale : " +
                                  state.cart.getTotal().toString() +
                                  "€",
                              style: TextStyle(
                                  fontSize: totalHeight * 2 / 6,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: CartItemList(
                      height: itemListHeight,
                      items: state.cart.getProducts(),
                    ),
                  ),
                  Container(
                    height: buttonsHeight,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: buttonsHeight*2/3,
                          width: MediaQuery.of(context).size.width/4,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 1, 136, 73),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(8.0, 8.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 1,
                                ),
                              ]),
                          child: FlatButton(
                            child: Text(
                              "COMPRA",
                              style: TextStyle(
                                fontSize: buttonsHeight/4,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
