import 'package:dapozzo_ventura_app/business_logic/blocs/cart_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/blocs/good_typology_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/events/cart_event.dart';
import 'package:dapozzo_ventura_app/business_logic/events/good_typology_event.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/states/good_typology_state.dart';
import 'package:dapozzo_ventura_app/ui/color_selector.dart';
import 'package:dapozzo_ventura_app/ui/lists/good_images_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cart_icon.dart';

class GoodTypologyPage extends StatefulWidget {
  final GoodTypologyModel goodTypology;

  const GoodTypologyPage({Key key, @required this.goodTypology})
      : super(key: key);

  @override
  _GoodTypologyPageState createState() => _GoodTypologyPageState();
}

class _GoodTypologyPageState extends State<GoodTypologyPage> {
  CartBloc _cartBloc;
  GoodTypologyBloc _goodTypologyBloc;
  List<bool> isSelected;

  List<ColorModel> colors = [];
  ColorModel currentColor;
  GoodTypologyModel goodTypology;

  @override
  void initState() {
    super.initState();
    _cartBloc = BlocProvider.of<CartBloc>(context);
    _goodTypologyBloc = BlocProvider.of<GoodTypologyBloc>(context);
    goodTypology = widget.goodTypology;
    _goodTypologyBloc.add(GoodTypologyEventInitialize(goodTypology));
  }

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
        actions: [
          CartIcon(),
        ],
        title: Text(goodTypology.name),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 7.5),
        child:  BlocBuilder<GoodTypologyBloc, GoodTypologyState>(
            builder: (context, state) {
              if(state is GoodTypologyStateOutOfStock){
              return Center(
                child: Text(
                  "OUT OF STOCK",
                  style: TextStyle(color: Colors.red),
                ),
              );

            }else{
            return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<GoodTypologyBloc, GoodTypologyState>(
                  builder: (context, state) {
                    if (state is GoodTypologyLoadingState) {
                      return SizedBox(height: 350,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children:[ CircularProgressIndicator()]),
                      );
                    } else {
                      if (state is GoodTypologyCurrentState) {
                        return GoodImagesList(
                          images: state.goods[0].images,
                        );
                      }  else {
                          return Text("ERROR WITH GOODTYPOLOGYBLOC");
                        }
                      }

                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<GoodTypologyBloc, GoodTypologyState>(
                            builder: (context, state) {
                              if (state is GoodTypologyUninitializedState) {
                                return Column();
                              } else {
                                if (state is GoodTypologyLoadingState) {
                                  return ColorSelector(
                                    colors: colors,
                                    current: currentColor,
                                  );
                                } else {
                                  if (state is GoodTypologyCurrentState) {
                                    colors = state.colors;
                                    currentColor = state.currentSearch;
                                    return ColorSelector(
                                      colors: state.colors,
                                      current: state.currentSearch,
                                    );
                                  }  else {
                                      return Text("STATO DI ERRORE GOODTYPOLOGYBLOC");
                                    }
                                  }
                                }

                            },
                          ),
                        ],
                      ),
                      BlocBuilder<GoodTypologyBloc, GoodTypologyState>(
                          builder: (context, state) {

                              if (state is GoodTypologyLoadingState) {
                                return Column();
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(7.5),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey[300],
                                                    offset: Offset(4.0, 4.0),
                                                    blurRadius: 5.0,
                                                    spreadRadius: 1,
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.circular(15)),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Text("Q.ty"),
                                                  SizedBox(height: 20),
                                                  DropdownButton(
                                                    items: [],
                                                    onChanged: null,
                                                    // values: _selectedSize,
                                                    // items: _dropdownMenuItems,
                                                    // onChanged: onChangeDropdownItem,
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey[300],
                                                  offset: Offset(4.0, 4.0),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Text("Size"),
                                                SizedBox(height: 20),
                                                DropdownButton(
                                                    value: null, items: null, onChanged: null)
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                );
                              }

                          }),
                      BlocBuilder<GoodTypologyBloc, GoodTypologyState>(
                          builder: (context, state) {

                              if (state is GoodTypologyCurrentState) {
                                return AddToChartButton(true);
                              }else{
                                if(state is GoodTypologyLoadingState){
                                  return AddToChartButton(false);
                                }else{
                                  return Text("ERROR");
                                }
                              }

                          }),
                    ],
                  ),
                ),

              ],
            );
          }}
        ),
      ),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                BlocProvider.of<GoodTypologyBloc>(context)
                    .add(GoodTypologyEventClear());
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back));
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
          BlocBuilder<GoodTypologyBloc, GoodTypologyState>(
            builder: (context, state) {
              if (state is GoodTypologyStateOutOfStock) {
                return SizedBox(
                  height: 10,
                );
              } else {
                return Column(
                  children: [
                    RaisedButton(
                      child: Text("Add to cart"),
                      onPressed: () {
                        _cartBloc.add(CartAddEvent(goodTypology.name));
                        _showSuccesPopup();
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
                  ],
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: BlocBuilder<GoodTypologyBloc, GoodTypologyState>(
              builder: (context, state) {
                if (state is GoodTypologyUninitializedState) {
                  return Column();
                } else {
                  if (state is GoodTypologyStateOutOfStock) {
                    return SizedBox(
                      height: 20,
                    );
                  } else {
                    if (state is GoodTypologyLoadingState) {
                      return ColorSelector(
                        colors: colors,
                        current: currentColor,
                      );
                    } else {
                      if (state is GoodTypologyCurrentState) {
                        colors = state.colors;
                        currentColor = state.currentSearch;
                        return ColorSelector(
                          colors: state.colors,
                          current: state.currentSearch,
                        );
                      } else {
                        return Text("STATO DI ERRORE GOODTYPOLOGYBLOC");
                      }
                    }
                  }
                }
              },
            ),
          ),
          BlocBuilder<GoodTypologyBloc, GoodTypologyState>(
            builder: (context, state) {
              if (state is GoodTypologyLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (state is GoodTypologyStateOutOfStock) {
                  return Center(
                    child: Text(
                      "OUT OF STOCK",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  if (state is GoodTypologyCurrentState) {
                    return Expanded(
                      child: Container(
                        child: GoodImagesList(
                          images: state.goods[0].images,
                        ),
                      ),
                    );
                  } else {
                    return Text("ERROR WITH GOODTYPOLOGYBLOC");
                  }
                }
              }
            },
          ),
        ],
      ),
    );
  }
*/
//++++++++++++++++++++++++  DropDown Size   ++++++++++++++++++++++++

// class DropDownState extends State<DropDown> {
// List<Size> _sizes = Size.getSizes();
// List<DropdownMenuItem<Size>> _dropdownMenuItems;
// Size _selectedSizes;

// @override
// void initState(){
//   _dropownMenuItems = buildDropdownMenuItems(_sizes);
//   _selectedSizes = _dropdownMenuItems[0].value;
//   super.initState();
// }

// List<DropdownMenuItem<Size> buildDropdownMenuItems(List sizes){
//   List<DropdownMenuItem<Size>> items = List();
//   for (Size size in sizes){
//     items.add(DropdownMenuItem(child: Text(size.name),value:size));
//   }
//   return items;
// };

// }
// +++++++++++++++++++++++  PopUp Successo  ++++++++++++++++++++++++
  Container AddToChartButton(bool on){
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 1, 136, 73),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              offset: Offset(4.0, 4.0),
              blurRadius: 5.0,
              spreadRadius: 1,
            ),
          ]),
      child: FlatButton(
        child: Text("ADD TO CART",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: (on == true) ? Colors.white : Colors.white38,
                fontStyle: FontStyle.normal)),
        onPressed: () {
          _cartBloc.add(CartAddEvent(goodTypology.name));
          _showSuccesPopup();
        },
      ),
    );
  }


  Future<void> _showSuccesPopup() async {
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pop(context);
    });
    return showDialog<void>(
      barrierColor: Colors.black54.withOpacity(0.02),
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 2,
          backgroundColor: Colors.lightGreen.withOpacity(0.5),
          title: Center(
            child: Text('Success'),
          ),
        );
      },
    );
  }
}
