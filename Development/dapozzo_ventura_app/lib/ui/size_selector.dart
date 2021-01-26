import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SizeSelector extends StatelessWidget {
  final List<SizeModel> sizes;

  const SizeSelector({
    Key key,
    this.sizes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Text("Sizes"),
            Container(
                width: 65,
                child: Center(
                    child: DropDownSizeWidget(sizes: getSizesNames(sizes)))),
          ],
        ),
      ),
    );
  }
}

//++++++++++++++++++++++++  DropDown Size   ++++++++++++++++++++++++

class DropDownSizeWidget extends StatefulWidget {
  final List<String> sizes;
  DropDownSizeWidget({Key key, this.sizes}) : super(key: key);

  @override
  _DropDownSizeWidgetState createState() => _DropDownSizeWidgetState();
}

class _DropDownSizeWidgetState extends State<DropDownSizeWidget> {
  List<String> sizes;
  String dropdownValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sizes = widget.sizes;
    dropdownValue = sizes[0];
  }

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
      items: sizes.map<DropdownMenuItem<String>>((String value) {
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
