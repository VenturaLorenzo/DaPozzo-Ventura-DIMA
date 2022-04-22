import 'dart:async';
import 'package:dapozzo_ventura_app/business_logic/cubit/cart_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/shipping_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/payment_server.dart';
import 'package:dapozzo_ventura_app/data/models/order_model.dart';
import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/shippingAddr_repository.dart';
import 'package:dapozzo_ventura_app/global.dart';
import 'package:dapozzo_ventura_app/states/cart_state.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:dapozzo_ventura_app/ui/lists/address_selection.dart';
import 'package:dapozzo_ventura_app/ui/lists/cart_items_list.dart';
import 'package:dapozzo_ventura_app/ui/pages/stripe_checkout_page.dart';
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
  OrderModel order;

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
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: buttonsHeight * 2 / 3,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 1, 136, 73),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(30),
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
                                        fontSize: buttonsHeight / 4,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (state.cart.getProducts().isNotEmpty) {
                                        if (Globals.currentUser == null) {
                                          _showPopupLogin();
                                        } else {
                                          // ShippingAddrRepository.getAddrByUser(
                                          //         Globals.currentUser.id)
                                          //     .then((addresses) =>
                                          //         _showAddressChoice(
                                          //             addresses));
                                          // Navigator.pushNamed(
                                          //   context,
                                          //   "/payment",
                                          // );

                                          // Server()
                                          //     .createCheckout(
                                          //         state.cart.getTotal(),
                                          //         "Pagamento eQuip")
                                          //     .then((value) => {
                                          //           Navigator.of(context)
                                          //               .push(MaterialPageRoute(
                                          //             builder: (_) =>
                                          //                 CheckoutPage(
                                          //                     sessionId: value),
                                          //           ))
                                          //         });
                                          order = new OrderModel();
                                          order.userId = Globals.currentUser.id;
                                          order.orderItems =
                                              state.cart.getProducts();
                                          BlocProvider.of<ShippingCubit>(
                                                  context)
                                              .initialize();
                                          Navigator.pushNamed(
                                              context, "/shipping",
                                              arguments: {
                                                "import": state.cart.getTotal(),
                                                "order": order,
                                              });
                                        }
                                      } else {
                                        _showPopupNoItems();
                                      }
                                    })),
                          ]))
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

// +++++++++++++++++++++++  PopUp Successo  ++++++++++++++++++++++++

  Future<void> _showPopupLogin() async {
    return showDialog<void>(
      barrierColor: Colors.lightGreen.withOpacity(0.02),
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 2,
          backgroundColor: Colors.white.withOpacity(0.80),
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Non sei ancora Loggato!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Per acquistare loggati o registrati ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: () {
                    //Chiudo popup
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[400],
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
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: null,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[200],
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
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/registration",
                          );
                        },
                        child: Text(
                          "REGISTRATI",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        );
      },
    ).then((value) {});
  }

  // Future<void> _showAddressChoice(List<ShippingAddrModel> addresses) async {
  //   return showDialog<void>(
  //       barrierColor: Colors.lightGreen.withOpacity(0.02),
  //       context: context,
  //       barrierDismissible: true, // user must tap button!
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           elevation: 4,
  //           backgroundColor: Colors.white.withOpacity(0.80),
  //           title: Column(
  //             children: [
  //               FlatButton(
  //                 onPressed: () {
  //                   //Chiudo popup
  //                   Navigator.of(context, rootNavigator: true).pop();
  //                   // Navigator.pushNamed(context, "/login");
  //                 },
  //                 child: Container(
  //                   height: 40,
  //                   decoration: BoxDecoration(
  //                       color: Colors.orange[400],
  //                       shape: BoxShape.rectangle,
  //                       borderRadius: BorderRadius.circular(15),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.grey[300],
  //                           offset: Offset(4.0, 4.0),
  //                           blurRadius: 5.0,
  //                           spreadRadius: 1,
  //                         ),
  //                       ]),
  //                   child: Center(
  //                     child: Text(
  //                       "USE DEFAULT ADDRESS",
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               AddressSelection(
  //                 addresses: addresses,
  //               ),
  //               FlatButton(
  //                 onPressed: () {},
  //                 child: Container(
  //                   height: 40,
  //                   decoration: BoxDecoration(
  //                       color: Colors.orange[300],
  //                       shape: BoxShape.rectangle,
  //                       borderRadius: BorderRadius.circular(15),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.grey[300],
  //                           offset: Offset(4.0, 4.0),
  //                           blurRadius: 5.0,
  //                           spreadRadius: 1,
  //                         ),
  //                       ]),
  //                   child: Center(
  //                     child: Text(
  //                       "ADD NEW ADDRESS",
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           actions: [
  //             FlatButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text("Continua lo Shopping"))
  //           ],
  //         );
  //       });
  // }

  Future<void> _showPopupNoItems() async {
    return showDialog<void>(
        barrierColor: Colors.lightGreen.withOpacity(0.02),
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 4,
            backgroundColor: Colors.white.withOpacity(0.80),
            title: Text("Attenzione"),
            content: Text("Non ci sono oggetti nel carrello"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Continua lo Shopping"))
            ],
          );
        });
  }
}
