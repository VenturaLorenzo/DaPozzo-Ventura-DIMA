import 'package:dapozzo_ventura_app/business_logic/cubit/size_cubit.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:dapozzo_ventura_app/states/size_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeSelector extends StatefulWidget {
  final List<SizeModel> sizes;

  const SizeSelector({
    Key key,
    this.sizes,
  }) : super(key: key);

  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  List<SizeModel> sizes;
  SizeCubit _sizeCubit;

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
    return BlocBuilder<SizeCubit, SizeState>(builder: (context, state) {
      if (state is SizeStateUninitialized) {
        return  Container(
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
                SizedBox(
                    height: 40,
                    width: 80,
                   ),
              ],
            ),
          ),
        );
      } else {
        if (state is SizeStateCurrent) {
          print(state.currentSize);
          print(widget.sizes);
          if (!getSizesNames(widget.sizes).contains(state.currentSize)) {
            print("entro qui dio cane");
            return  Container(
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
                    SizedBox(
                        height: 40,
                        width: 80,
                       ),
                  ],
                ),
              ),
            );
          } else {
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
                padding: const EdgeInsets.all(2.5),
                child: Column(
                  children: [
                    Text("Sizes"),
                    Container(
                        height: 40,
                        width: 80,
                        child: Center(
                            child: DropDownSizeWidget(
                                sizes: getSizesNames(widget.sizes),
                                dropdownValue: widget.sizes[0].name))),
                  ],
                ),
              ),
            );
          }
        } else {
          return Text("ERRORE");
        }
      }
    });
  }

  Container dropDownBox(bool loaded) {
    if (loaded) {
      Container(
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
                  height: 40,
                  width: 80,
                  child: Center(
                      child: DropDownSizeWidget(
                          sizes: getSizesNames(widget.sizes),
                          dropdownValue: widget.sizes[0].name))),
            ],
          ),
        ),
      );
    } else {
      Container(
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

            ],
          ),
        ),
      );
    }
  }
}
//++++++++++++++++++++++++  DropDown Size   ++++++++++++++++++++++++

class DropDownSizeWidget extends StatelessWidget {
  final List<String> sizes;
  final String dropdownValue;

  DropDownSizeWidget({this.dropdownValue, this.sizes});

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
        BlocProvider.of<SizeCubit>(context).setSize(newValue);
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

List<String> getSizesNames(List<SizeModel> goodSize) {
  var retVal = new List<String>();

  goodSize.forEach((element) {
    retVal.add(element.name);
  });

  return retVal;
}
