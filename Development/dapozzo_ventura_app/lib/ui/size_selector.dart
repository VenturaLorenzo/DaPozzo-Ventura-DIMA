import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final List<SizeModel> sizes;
  final SizeModel current;
  final GoodTypologyModel goodTypology;

  const SizeSelector({Key key, this.sizes, this.current, this.goodTypology})
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
    );
  }
}
