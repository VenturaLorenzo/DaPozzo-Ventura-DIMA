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
                  child: DropDownQuantityWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//++++++++++++++++++++++++  DropDown Size   ++++++++++++++++++++++++

class DropDownQuantityWidget extends StatefulWidget {
  @override
  _DropDownSizeWidgetState createState() => _DropDownSizeWidgetState();
}

class _DropDownSizeWidgetState extends State<DropDownQuantityWidget> {
  List<String> quantity = ["1", "2", "3", "4", "5"];
  String dropdownValue = "1";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      disabledHint: Text('none'),
      style: TextStyle(color: Colors.black54),
      underline: Container(
        height: 1,
        color: Colors.black26,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: quantity.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

getSizesNames(List<SizeModel> goodSize) {
  var retVal = new List<String>();

  goodSize.forEach((element) {
    retVal.add(element.name);
  });

  return retVal;
}
