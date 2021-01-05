import 'package:dapozzo_ventura_app/business_logic/blocs/good_typology_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/events/good_typology_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorSelector extends StatelessWidget {
  final List<MaterialColor> colors;
  final MaterialColor current;

  const ColorSelector({Key key, this.colors, this.current}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: colors.map((color) {
        if (color == current) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<GoodTypologyBloc>(context)
                    .add(GoodTypologyEventSearchGood(color));
              },
              child: Container(
                width: 25.0,
                height: 25.0,
                decoration: new BoxDecoration(
                  // border: Border.all(color: Colors.black54, width: 2),
                  borderRadius: BorderRadius.circular(5),
                  color: color,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<GoodTypologyBloc>(context)
                    .add(GoodTypologyEventSearchGood(color));
              },
              child: Container(
                width: 30.0,
                height: 30.0,
                decoration: new BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(4.0, 4.0),
                      blurRadius: 5.0,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }).toList(),
    );
  }
}
