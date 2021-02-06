import 'dart:async';
import 'package:dapozzo_ventura_app/business_logic/cubit/cart_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/good_window_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/quantity_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/size_cubit.dart';
import 'package:dapozzo_ventura_app/data/models/good_image_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/states/good_window_state.dart';
import 'package:dapozzo_ventura_app/states/quantity_state.dart';
import 'package:dapozzo_ventura_app/states/size_state.dart';
import 'package:dapozzo_ventura_app/ui/color_selector.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:dapozzo_ventura_app/ui/lists/good_images_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../quantity_selector.dart';
import '../size_selector.dart';

class GoodWindowPage extends StatefulWidget {
  final GoodTypologyModel goodTypology;

  const GoodWindowPage({Key key, @required this.goodTypology})
      : super(key: key);

  @override
  _GoodWindowPageState createState() => _GoodWindowPageState();
}

class _GoodWindowPageState extends State<GoodWindowPage> {
  GoodWindwCubit _goodWindowCubit;
  QuantityCubit _quantityCubit;
  SizeCubit _sizeCubit;
  List<bool> isSelected;
  GoodTypologyModel goodTypology;
  double pageHeight;
  double imageListHeight;
  double selectionRowHeight;
  double buttonRowHeight;

  @override
  void initState() {
    super.initState();
    //  _cartBloc = BlocProvider.of<CartBloc>(context);
    _sizeCubit = BlocProvider.of<SizeCubit>(context);
    _quantityCubit = BlocProvider.of<QuantityCubit>(context);

    _goodWindowCubit = BlocProvider.of<GoodWindwCubit>(context);
    goodTypology = widget.goodTypology;
    _goodWindowCubit.initialize(goodTypology);
  }

  @override
  void dispose() {
    _goodWindowCubit.reset();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pageHeight = MediaQuery.of(context).size.height;
    imageListHeight = pageHeight * 2 / 3;
    selectionRowHeight = pageHeight / 9;
    buttonRowHeight = pageHeight / 9;
    return Scaffold(
      appBar: EquipAppBar(
        withMenu: false,
        title: goodTypology.name,
      ),
      body: BlocBuilder<GoodWindwCubit, GoodWindowState>(
          builder: (context, state) {
        if (state is GoodWindowInitState) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
            ),
          );
        }

        if (state is GoodWindowImageLoadingState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: imageListHeight,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                    ),
                  )),
              Container(
                height: pageHeight / 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ColorSelector(
                      goodTypology: state.typology,
                      colors: state.colors,
                      current: state.currentColor,
                    ),
                    QuantitySelector(height: selectionRowHeight),
                    SizeSelector(
                      height: selectionRowHeight,
                      sizes: state.sizes,
                    ),
                  ],
                ),
              ),
              Container(
                height: buttonRowHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(buttonRowHeight / 9),
                      child: Container(
                        height: buttonRowHeight * 7 / 9,
                        width: MediaQuery.of(context).size.width / 2,
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
                                  fontSize:
                                      MediaQuery.of(context).size.height / 40,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70,
                                  fontStyle: FontStyle.normal)),
                          onPressed: () {
//                          _showSuccesPopup();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }

        if (state is GoodWindowImageLoadedState) {
          BlocProvider.of<SizeCubit>(context).setSize(state.sizes[0].name);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: imageListHeight,
                child: GoodImagesList(
                  height: imageListHeight,
                  images: getNames(state.goodImages),
                  price: goodTypology.price,
                ),
              ),
              Container(
                height: pageHeight / 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ColorSelector(
                      goodTypology: state.typology,
                      colors: state.colors,
                      current: state.currentColor,
                    ),
                    QuantitySelector(height: selectionRowHeight),
                    SizeSelector(
                      height: selectionRowHeight,
                      sizes: state.sizes,
                    ),
                  ],
                ),
              ),
              Container(
                height: buttonRowHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(buttonRowHeight / 9),
                      child: Container(
                        height: buttonRowHeight * 7 / 9,
                        width: MediaQuery.of(context).size.width / 2,
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
                        child: BlocBuilder<SizeCubit, SizeState>(
                            builder: (context, sizeState) {
                          return BlocBuilder<QuantityCubit, QuantityState>(
                              builder: (context, quantityState) {
                            return FlatButton(
                              child: Text("ADD TO CART",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: (sizeState is SizeStateCurrent)
                                          ? (sizeState.currentSize != "none")
                                              ? Colors.white
                                              : Colors.white70
                                          : Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              40,
                                      fontStyle: FontStyle.normal)),
                              onPressed: () {
                                if (quantityState is QuantityStateCurrent &&
                                    sizeState is SizeStateCurrent) {
                                  if (sizeState.currentSize != "none") {
                                    BlocProvider.of<CartCubit>(context)
                                        .addGood(GoodModel(
                                      color: state.currentColor,
                                      images: state.goodImages,
                                      quantity: quantityState.currentQuantity,
                                      type: goodTypology,
                                      size: sizeState.currentSize,
                                      vendorName: state.vendor,
                                    ));
                                    _showPopup(
                                        "ITEM ADDED TO CART",
                                        Colors.green[900],
                                        Icons.check,
                                        Colors.green[900]);
                                  } else {
                                    _showPopup(
                                        "ITEM NOT AVAILABLE",
                                        Colors.red[400],
                                        Icons.close,
                                        Colors.red[400]);
                                  }
                                } else {
                                  throw ("QUANTITY NOT SETTED");
                                }
                              },
                            );
                          });
                        }),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }

        if (state is GoodWindowErrorState) {
          if (state is GoodWindowImagesNotFuondState) {
            return Text("IMAGE NOT FOUND");
          }
          if (state is GoodWindowColorsNotFoundState) {
            return Text("COLORS NOT FOUND");
          } else {
            return Text("ERRORE GENERCO TIPO 2");
          }
        } else {
          return Text("ERRORE GENERICO TIPO 1");
        }
      }),
    );
  }

// +++++++++++++++++++++++  PopUp Successo  ++++++++++++++++++++++++

  Future<void> _showPopup(
      String text, Color textColor, IconData icon, Color iconColor) async {
    Timer timer = Timer(Duration(milliseconds: 2000), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 2,
          backgroundColor: Colors.grey[200].withOpacity(0.80),
          title: Column(children: [
            Text(
              text,
              style: TextStyle(fontSize: pageHeight / 40, color: textColor),
            ),
            Icon(
              icon,
              color: iconColor,
              size: pageHeight / 10,
            ),
          ]),
        );
      },
    ).then((value) {
      timer?.cancel();
      timer = null;
    });
  }

  getNames(List<GoodImageModel> goodImages) {
    var retVal = new List<String>();

    goodImages.forEach((element) {
      retVal.add(element.image);
    });

    return retVal;
  }
}
