import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final List<int> quantities;
  final SizeModel current;
  final GoodTypologyModel goodTypology;

  const QuantitySelector(
      {Key key, this.quantities, this.current, this.goodTypology})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
