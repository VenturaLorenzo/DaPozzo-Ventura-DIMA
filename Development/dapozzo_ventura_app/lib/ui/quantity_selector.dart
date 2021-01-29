import 'package:dapozzo_ventura_app/business_logic/cubit/quantity_cubit.dart';
import 'package:dapozzo_ventura_app/states/quantity_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  QuantityCubit _quantityCubit;
  @override
  void initState() {
    // TODO: implement initState
    print("im initializing");
    super.initState();
    _quantityCubit = BlocProvider.of<QuantityCubit>(context);
    _quantityCubit.setQuantity(1);
  }

  @override
  void dispose() {
    print("im disposing");

    // TODO: implement dispose
    super.dispose();
    _quantityCubit.reset();

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuantityCubit, QuantityState>(builder: (context, state) {
      if (state is QuantityStateUninitialized) {
        return CircularProgressIndicator();
      } else {
        if (state is QuantityStateCurrent) {
          return Padding(
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
                      width: 80,
                      child: Center(
                        child: DropDownQuantityWidget(
                          currentQuantity: state.currentQuantity,
                        ),
                      ),
                    ),
                  ],
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
  DropDownQuantityWidget({this.currentQuantity});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: currentQuantity,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      disabledHint: Text('none'),
      style: TextStyle(color: Colors.black54),
      underline: Container(
        height: 1,
        color: Colors.black26,
      ),
      onChanged: (int newValue) {
        BlocProvider.of<QuantityCubit>(context).setQuantity(newValue);
      },
      items: quantity.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
