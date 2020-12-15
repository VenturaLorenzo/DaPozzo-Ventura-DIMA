import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderChoice extends StatelessWidget {
  final List<bool> maleSelected;
  final List<bool> femaleSelected;

  const GenderChoice({this.maleSelected, this.femaleSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(children: [
        ToggleButtons(
            children: [Text("Uomo")],
            fillColor: Color.fromRGBO(33, 150, 243, 1),
            selectedBorderColor: Color.fromRGBO(33, 150, 243, 1),
            selectedColor: Colors.white,
            onPressed: (int index) {

              //BlocProvider.of<ShopWindowCubit>(context).toggleGender(0);
            },
            isSelected: maleSelected),
        ToggleButtons(
            children: [Text("Donna")],
            fillColor: Color.fromRGBO(255, 45, 85, 1),
            selectedBorderColor: Color.fromRGBO(255, 45, 85, 1),
            selectedColor: Colors.white,
            onPressed: (int index) {
            //  BlocProvider.of<ShopWindowCubit>(context).toggleGender(1);
            },
            isSelected: femaleSelected)
      ]),
    );
  }
}
