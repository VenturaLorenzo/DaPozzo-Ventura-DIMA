import 'package:dapozzo_ventura_app/business_logic/cubit/size_cubit.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:dapozzo_ventura_app/states/size_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeSelector extends StatefulWidget {
  final List<SizeModel> sizes;
  final double height;

  const SizeSelector({
    Key key,
    this.sizes,
    this.height,
  }) : super(key: key);

  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  List<SizeModel> sizes;
  SizeCubit _sizeCubit;
  double pageHeight;
  double pageWidth;
  double selectorWidth;
  double selectorHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sizeCubit = BlocProvider.of<SizeCubit>(context);
    sizes = widget.sizes;
  }

  @override
  void dispose() {
    _sizeCubit.reset();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pageHeight = MediaQuery.of(context).size.height;
    pageWidth = MediaQuery.of(context).size.width;
    selectorHeight = widget.height * 7 / 9;
    selectorWidth = pageWidth / 5;
    return BlocBuilder<SizeCubit, SizeState>(builder: (context, state) {
      if (state is SizeStateCurrent &&
          getSizesNames(widget.sizes).contains(state.currentSize)) {
        return Padding(
          padding: EdgeInsets.all(widget.height / 9),
          child: Container(
            height: widget.height * 7 / 9,
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
              padding: EdgeInsets.all(selectorHeight / 9),
              child: Container(
                height: selectorHeight * 7 / 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: selectorHeight * 7 / 27,
                      child: Text(
                        "Sizes",
                        style: TextStyle(
                            //  fontWeight: FontWeight.bold,
                            fontSize: selectorHeight * 6 / 27),
                      ),
                    ),
                    Container(
                        height: selectorHeight * 14 / 27,
                        width: selectorWidth,
                        child: Center(
                            child: DropDownSizeWidget(
                                width: selectorWidth,
                                height: selectorHeight * 14 / 27,
                                sizes: getSizesNames(widget.sizes),
                                dropdownValue: state.currentSize))),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Padding(
          padding: EdgeInsets.all(widget.height / 9),
          child: Container(
            height: widget.height * 7 / 9,
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
              padding: EdgeInsets.all(selectorHeight / 9),
              child: Container(
                height: selectorHeight * 7 / 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: selectorHeight * 7 / 27,
                      child: Text(
                        "Sizes",
                        style: TextStyle(
                            //  fontWeight: FontWeight.bold,
                            fontSize: selectorHeight * 6 / 27),
                      ),
                    ),
                    SizedBox(
                      height: selectorHeight * 14 / 27,
                      width: selectorWidth,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
//++++++++++++++++++++++++  DropDown Size   ++++++++++++++++++++++++

class DropDownSizeWidget extends StatelessWidget {
  final List<String> sizes;
  final String dropdownValue;
  final double width;
  final double height;

  DropDownSizeWidget({this.height, this.width, this.dropdownValue, this.sizes});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: height / 2,
      elevation: 16,
      disabledHint: Text('none'),
      style: TextStyle(color: Colors.black54),
      underline: Container(
        height: height / 20,
        color: Colors.black26,
      ),
      onChanged: (String newValue) {
        BlocProvider.of<SizeCubit>(context).setSize(newValue);
      },
      items: sizes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: height / 2),
          ),
        );
      }).toList(),
    );
  }
}

List<String> getSizesNames(List<SizeModel> goodSize) {
  var retVal = new List<String>();

  goodSize.forEach((element) {
    retVal.add(element.name);
  });

  return retVal;
}
