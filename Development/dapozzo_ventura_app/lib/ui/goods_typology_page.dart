import 'package:dapozzo_ventura_app/blocs/cart_bloc.dart';
import 'package:dapozzo_ventura_app/events/cart_event.dart';
import 'package:dapozzo_ventura_app/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoodTypologyPage extends StatefulWidget {
  @override
  _GoodTypologyPageState createState() => _GoodTypologyPageState();
}

class _GoodTypologyPageState extends State<GoodTypologyPage> {
   CartBloc _cartBloc;

 // _GoodTypologyPageState({this.GoodTypology});
  @override
  Widget build(BuildContext context) {
    final GoodTypology good_typology = ModalRoute.of(context).settings.arguments;
    _cartBloc= BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: EquipAppBar(title: good_typology.name,),
      body: Column(
        children: [
          /*TextField(
            onSubmitted: (typedText) {
              _vendorBloc.add(VendorEventSearch(typedText ,vendor));
            },
            decoration: InputDecoration(labelText: "Search"),
          ),*/
          RaisedButton(
            child: Text("Add to cart"),
            onPressed: () {
              _cartBloc.add(CartAddEvent(good_typology.name));

            },
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Size"),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              Column(
                children: [
                  Text("Q.ty"),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              Column(
                children: [
                  Text("Price"),
                  SizedBox(
                    height: 7,
                  ),
                  Text("mom"),
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                color: Colors.black38,
                child:Icon(Icons.add),

              ),
              Container(
                  color: Colors.black38,
                  child: Icon(Icons.add),)
            ],
          ),
          Container(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
