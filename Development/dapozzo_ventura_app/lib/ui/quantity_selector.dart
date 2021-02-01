import 'package:dapozzo_ventura_app/business_logic/cubit/quantity_cubit.dart';
import 'package:dapozzo_ventura_app/states/quantity_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuantitySelector extends StatefulWidget {
  final double height;

  const QuantitySelector({Key key, this.height}) : super(key: key);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  QuantityCubit _quantityCubit;
  double pageWidth;
  double selectorWidth;
  double selectorHeight;
  var borderRad = 7.5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quantityCubit = BlocProvider.of<QuantityCubit>(context);
    _quantityCubit.setQuantity(1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _quantityCubit.reset();
  }

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    selectorHeight = widget.height * 7 / 9;
    selectorWidth = pageWidth / 5;
    return BlocBuilder<QuantityCubit, QuantityState>(builder: (context, state) {
      if (state is QuantityStateUninitialized) {
        return Padding(
          padding: EdgeInsets.all(widget.height / 9),
          child: Container(
            height: selectorHeight,
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
                borderRadius: BorderRadius.circular(borderRad)),
            child: Padding(
              padding: EdgeInsets.all(selectorHeight / 9),
              child: Container(
                height: selectorHeight * 7 / 9,
                child: Column(
                  children: [
                    Container(
                      height: selectorHeight * 7 / 27,
                      child: Text(
                        "Quantity",
                        style: TextStyle(fontSize: selectorHeight * 6 / 27),
                      ),
                    ),
                    SizedBox(
                      height: selectorHeight * 14 / 27,
                      width: selectorWidth,
                      child: Center(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        if (state is QuantityStateCurrent) {
          return Padding(
            padding: EdgeInsets.all(widget.height / 9),
            child: Container(
              height: selectorHeight,
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
                  borderRadius: BorderRadius.circular(borderRad)),
              child: Padding(
                padding: EdgeInsets.all(selectorHeight / 9),
                child: Container(
                  height: selectorHeight * 7 / 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: selectorHeight * 7 / 27,
                        child: Text(
                          "Quantity",
                          style: TextStyle(fontSize: selectorHeight * 6 / 27),
                        ),
                      ),
                      Container(
                        height: selectorHeight * 14 / 27,
                        width: selectorWidth,
                        child: Center(
                          child: DropDownQuantityWidget(
                            width: selectorWidth,
                            height: selectorHeight * 14 / 27,
                            currentQuantity: state.currentQuantity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Text("ERRORE");
        }
      }
    });
  }
}

//++++++++++++++++++++++++  DropDown Size   ++++++++++++++++++++++++

class DropDownQuantityWidget extends StatelessWidget {
  final List<int> quantity = [1, 2, 3, 4, 5, 6];
  final int currentQuantity;
  final width;
  final height;

  DropDownQuantityWidget({this.height, this.width, this.currentQuantity});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: currentQuantity,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: height / 2,
      elevation: 16,
      disabledHint: Text('none'),
      style: TextStyle(color: Colors.black54),
      underline: Container(
        height: height / 20,
        color: Colors.black26,
      ),
      onChanged: (int newValue) {
        BlocProvider.of<QuantityCubit>(context).setQuantity(newValue);
      },
      items: quantity.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: height / 2),
          ),
        );
      }).toList(),
    );
  }
}
