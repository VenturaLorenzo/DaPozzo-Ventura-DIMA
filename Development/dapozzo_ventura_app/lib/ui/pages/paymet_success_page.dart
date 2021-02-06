import 'package:dapozzo_ventura_app/business_logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentSuccessPage extends StatefulWidget {
  @override
  _PaymentSuccessPageState createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.done_rounded,
                  color: Colors.green[400],
                  size: 80,
                ),
                Text(
                  "Grazie per aver usato eQuip",
                  style: TextStyle(
                      color: Colors.green[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                    color: Colors.blue[300],
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
                    "TORNA AL NEGOZIO",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context).clear();
                    Navigator.pushNamed(
                      context,
                      '/launch',
                    );
                  },
                )),
          )
        ],
      )),
    );
  }
}
