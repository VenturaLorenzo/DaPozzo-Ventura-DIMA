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
import 'package:dapozzo_ventura_app/ui/lists/good_images_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cart_icon.dart';
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
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: BlocBuilder<GoodWindwCubit, GoodWindowState>(
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
                    height: 375,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.black54),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ColorSelector(
                      goodTypology: state.typology,
                      colors: state.colors,
                      current: state.currentColor,
                    ),
                    SizeSelector(
                      sizes: state.sizes,
                    ),
                    QuantitySelector(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
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
                                fontWeight: FontWeight.w600,
                                color: Colors.white70,
                                fontStyle: FontStyle.normal)),
                        onPressed: () {
//                          _showSuccesPopup();
                        },
                      ),
                    ),
                  ],
                )
              ],
            );
          }

          if (state is GoodWindowImageLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 375,
                  child: GoodImagesList(
                    images: getNames(state.goodImages),
                    price: goodTypology.price,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ColorSelector(
                      goodTypology: state.typology,
                      colors: state.colors,
                      current: state.currentColor,
                    ),
                    SizeSelector(
                      sizes: state.sizes,
                      // current: state.currentSize,
                    ),
                    QuantitySelector()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
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
                      child: BlocBuilder<SizeCubit, SizeState>(
                          builder: (context, sizeState) {
                        return BlocBuilder<QuantityCubit, QuantityState>(
                            builder: (context, quantityState) {
                          return FlatButton(
                            child: Text("ADD TO CART",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal)),
                            onPressed: () {
                              if (quantityState is QuantityStateCurrent &&
                                  sizeState is SizeStateCurrent) {
                                BlocProvider.of<CartCubit>(context).addGood(
                                    GoodModel(
                                        color: state.currentColor,
                                        images: state.goodImages,
                                        quantity: quantityState.currentQuantity,
                                        type: goodTypology,
                                        size: sizeState.currentSize));
                              } else {
                                throw ("QUANTITY NOT SETTED");
                              }
                              _showSuccesPopup();
                            },
                          );
                        });
                      }),
                    ),
                  ],
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
      ),
    );
  }

// +++++++++++++++++++++++  PopUp Successo  ++++++++++++++++++++++++

  Future<void> _showSuccesPopup() async {
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pop(context);
    });
    return showDialog<void>(
      barrierColor: Colors.lightGreen.withOpacity(0.02),
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 2,
          backgroundColor: Colors.grey[300].withOpacity(0.80),
          title: Column(children: [
            Text(
              "Added to CART",
              style: TextStyle(color: Colors.green[900]),
            ),
            Icon(
              Icons.check,
              color: Colors.green[900],
              size: 50,
            ),
          ]),
        );
      },
    );
  }

  getNames(List<GoodImageModel> goodImages) {
    var retVal = new List<String>();

    goodImages.forEach((element) {
      retVal.add(element.image);
    });

    return retVal;
  }
}
