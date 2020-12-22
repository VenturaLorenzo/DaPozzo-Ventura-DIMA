import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderChoice extends StatelessWidget {
  final List<bool> maleSelected;
  final List<bool> femaleSelected;

  const GenderChoice({this.maleSelected, this.femaleSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                offset: Offset(4.0, 4.0),
                blurRadius: 5.0,
                spreadRadius: 1,
              ),
              // BoxShadow(
              //   color: Colors.white,
              //   offset: Offset(0, 0),
              //   blurRadius: 0.0,
              //   spreadRadius: 0,
              // ),
            ]),
        child: Row(children: [
          ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text("Uomo",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )),
                )
              ],
              borderColor: Colors.grey[200],
              fillColor: Color.fromRGBO(33, 150, 243, 1),
              selectedBorderColor: Color.fromRGBO(33, 150, 243, 1),
              selectedColor: Colors.white,
              onPressed: (int index) {
                //BlocProvider.of<ShopWindowCubit>(context).toggleGender(0);
              },
              isSelected: maleSelected),
          ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text("Donna",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )),
                )
              ],
              borderColor: Colors.grey[200],
              fillColor: Color.fromRGBO(255, 45, 85, 1),
              selectedBorderColor: Color.fromRGBO(255, 45, 85, 1),
              selectedColor: Colors.white,
              onPressed: (int index) {
                //  BlocProvider.of<ShopWindowCubit>(context).toggleGender(1);
              },
              isSelected: femaleSelected)
        ]),
      ),
    );
  }
}
