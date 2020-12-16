import 'package:dapozzo_ventura_app/business_logic/blocs/cart_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/blocs/good_typology_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/events/cart_event.dart';
import 'package:dapozzo_ventura_app/business_logic/events/good_typology_event.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/states/good_typology_state.dart';
import 'package:dapozzo_ventura_app/ui/color_selector.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:dapozzo_ventura_app/ui/lists/good_images_list.dart';import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart_icon.dart';

class GoodTypologyPage extends StatefulWidget {
  final GoodTypologyModel goodTypology;

  const GoodTypologyPage({Key key, @required this.goodTypology}) : super(key: key);

  @override
  _GoodTypologyPageState createState() => _GoodTypologyPageState();
}

class _GoodTypologyPageState extends State<GoodTypologyPage> {
  CartBloc _cartBloc;
  GoodTypologyBloc _goodTypologyBloc;
  List<bool> isSelected ;
  List<MaterialColor> colors=[];
  MaterialColor currentColor;
  GoodTypologyModel goodTypology;
  @override
  void initState() {
    super.initState();
    _cartBloc = BlocProvider.of<CartBloc>(context);
    _goodTypologyBloc=BlocProvider.of<GoodTypologyBloc>(context);
    goodTypology=widget.goodTypology;
    _goodTypologyBloc.add(GoodTypologyEventInitialize(goodTypology));

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: Builder(builder: (BuildContext context){

          return  IconButton(onPressed:() {
            Navigator.pop(context);
          } ,icon: Icon(Icons.arrow_back));
        }),
        actions: [
          CartIcon(),
        ],
        title: Text(goodTypology.name),
      ),
      body: Column(
        children: [

          SizedBox(
            height: 15,
          ),
          RaisedButton(
            child: Text("Add to cart"),
            onPressed: () {
              _cartBloc.add(CartAddEvent(goodTypology.name));
            _showMyDialog();
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
                  Text(goodTypology.price.toString()),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: BlocBuilder<GoodTypologyBloc,GoodTypologyState>(builder:(context,state){

              if(state is GoodTypologyUninitializedState){
                return Column();
              }else {
                if (state is GoodTypologyLoadingState) {
                  return ColorSelector(colors: colors,current: currentColor,);
                } else {
                  if (state is GoodTypologyCurrentState) {
                    colors=state.colors;
                    currentColor=state.currentSearch;
                    return ColorSelector(colors: state.colors,current: state.currentSearch,);
                  } else {
                    return Text("STATO DI ERRORE GOODTYPOLOGYBLOC");
                  }
                }
              }
            } ,

            ),
          ),

          BlocBuilder<GoodTypologyBloc,GoodTypologyState>(builder:(context,state){

            if(state is GoodTypologyLoadingState){
              return Center(child: CircularProgressIndicator());
            }else{
              if(state is GoodTypologyCurrentState){
                return Expanded(
                  child: Container(
                    child: GoodImagesList(
                      images:state.goods[0].images,
                    ),
                  ),
                );
              }else{
                return Text("ERROR WITH GOODTYPOLOGYBLOC");
              }
            }
          },

          ),
        ],
      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
