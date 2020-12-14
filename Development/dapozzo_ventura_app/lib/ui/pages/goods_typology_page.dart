import 'package:dapozzo_ventura_app/business_logic/blocs/cart_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/blocs/good_typology_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/events/cart_event.dart';
import 'package:dapozzo_ventura_app/business_logic/events/good_typology_event.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/states/good_typology_state.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:dapozzo_ventura_app/ui/lists/good_images_list.dart';import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  List<Color> colors=[];
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
      appBar: EquipAppBar(
        title: goodTypology.name,
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
                  return Column();
                } else {
                  if (state is GoodTypologyCurrentState) {
                    return Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: state.colors.map((color) {
                        if (color == state.currentSearch) {
                          return GestureDetector(onTap: () {
                            _goodTypologyBloc.add(
                                GoodTypologyEventSearchGood(color));
                          },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 35.0,
                                height: 35.0,
                                decoration: new BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black54, width: 5),
                                  color: color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return GestureDetector(onTap: () {
                            _goodTypologyBloc.add(
                                GoodTypologyEventSearchGood(color));
                          },
                            child: Padding(padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: new BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          );
                        }
                      }).toList(),
                    );
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
              return CircularProgressIndicator();
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
}
