import 'package:dapozzo_ventura_app/business_logic/cubit/good_window_cubit.dart';
import 'package:dapozzo_ventura_app/data/models/good_image_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/states/good_window_state.dart';
import 'package:dapozzo_ventura_app/ui/color_selector.dart';
import 'package:dapozzo_ventura_app/ui/lists/good_images_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cart_icon.dart';

class GoodWindowPage extends StatefulWidget {
  final GoodTypologyModel goodTypology;

  const GoodWindowPage({Key key, @required this.goodTypology})
      : super(key: key);

  @override
  _GoodWindowPageState createState() => _GoodWindowPageState();
}

class _GoodWindowPageState extends State<GoodWindowPage> {
  GoodWindwCubit _goodWindwCubit;
  List<bool> isSelected;
  GoodTypologyModel goodTypology;

  @override
  void initState() {
    super.initState();
  //  _cartBloc = BlocProvider.of<CartBloc>(context);
    _goodWindwCubit = BlocProvider.of<GoodWindwCubit>(context);
    goodTypology = widget.goodTypology;
    _goodWindwCubit.initialize(goodTypology);
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
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                      Container(
                        height: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ColorSelector(
                              goodTypology: state.typology,
                              colors: state.colors,
                              current: state.currentColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.5),
                              child: Container(
                                  width: 55,
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
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text("Q.ty"),
                                        DropdownButton(
                                            value: null,
                                            items: null,
                                            onChanged: null)
                                      ],
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.5),
                              child: Container(
                                  width: 55,
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
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text("Size"),
                                        DropdownButton(
                                            value: null,
                                            items: null,
                                            onChanged: null)
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 55,
                        width: 215,
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
                                  color: Colors.white60,
                                  fontStyle: FontStyle.normal)),
                          onPressed: () {},
                        ),
                      )
                    ]);
              }

              if (state is GoodWindowImageLoadedState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 375,
                      child: GoodImagesList(
                        images: getNames(state.goodImages),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ColorSelector(
                            goodTypology: state.typology,
                            colors: state.colors,
                            current: state.currentColor,
                          ),
                          // SizeSelector
                          Padding(
                            padding: const EdgeInsets.all(5),
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
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.5),
                                child: Column(
                                  children: [
                                    Text("Quantity"),
                                    Container(
                                      width: 65,
                                      child: Center(
                                        child: DropdownButton(
                                          items: [
                                            DropdownMenuItem(child: Text('1')),
                                            DropdownMenuItem(child: Text('2')),
                                            DropdownMenuItem(child: Text('3')),
                                            DropdownMenuItem(child: Text('4')),
                                          ],
                                          onChanged: (index) {},
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // QuantitySelector
                          Padding(
                            padding: const EdgeInsets.all(5),
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
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.5),
                                child: Column(
                                  children: [
                                    Text("Sizes"),
                                    Container(
                                      width: 65,
                                      child: Center(
                                        child: DropdownButton(
                                          items: [
                                            DropdownMenuItem(child: Text('S')),
                                            DropdownMenuItem(child: Text('M')),
                                            DropdownMenuItem(child: Text('L')),
                                            DropdownMenuItem(child: Text('XL')),
                                          ],
                                          onChanged: (index) {},
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 215,
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
                      //    _cartBloc.add(CartAddEvent(goodTypology.name));
                          _showSuccesPopup();
                        },
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
      ),
    );
  }
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

  getNames(List<GoodImageModel> goodImages) {
    var retVal = new List<String>();

    goodImages.forEach((element) {
      retVal.add(element.image);
    });

    return retVal;
  }
}