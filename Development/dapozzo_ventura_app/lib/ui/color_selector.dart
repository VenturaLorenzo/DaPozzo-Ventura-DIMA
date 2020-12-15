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
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      children: colors.map((color) {
        if (color == current) {
          return GestureDetector(onTap: () {
            BlocProvider.of<GoodTypologyBloc>(context).add(
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
            BlocProvider.of<GoodTypologyBloc>(context).add(
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
  }
}
