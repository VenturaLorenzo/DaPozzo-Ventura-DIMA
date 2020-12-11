
import 'package:dapozzo_ventura_app/blocs/vendor_bloc.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../gender_choice.dart';
import '../lists/goods_typology_list_widget.dart';
/*
class VendorPage extends StatefulWidget {
  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  var _vendorBloc;

  @override
  Widget build(BuildContext context) {
    final Vendor vendor = ModalRoute
        .of(context)
        .settings
        .arguments;
    print(vendor.name);
    _vendorBloc = BlocProvider.of<VendorBloc>(context);
    return Scaffold(
      appBar: EquipAppBar(title: "eQuip",),
      body:Column(children:[
      Expanded(
        child: BlocBuilder<VendorBloc, VendorState>(
          builder: (context, state) {
            List<GoodTypology> goodtypology;
            if (state is VendorStateLoading) {
              _vendorBloc.add(VendorEventInit(vendor));
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (state is VendorStateInitial) {
                goodtypology = state.goodtypology;
                return GoodTypologyList(goodtypology);
              } else {
                if (state is VendorStateSearched) {
                  goodtypology = state.result;
                  return GoodTypologyList(goodtypology);
                } else {
                  if (state is VendorStateGeneralError) {
                    return Text(state.error);
                  }
                }
              }
              return Text("Error");
            }
          },
        ),
      ),
      ],
      )
    );
  }
}
*/class VendorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Vendor vendor=ModalRoute.of(context).settings.arguments;
  final isSelectedCategory =List.generate(vendor.categories.length, (index) => false);
  final isSelectedMale= [false];
    final isSelectedFemale= [false];

    return Scaffold(
        appBar: EquipAppBar(title: vendor.name,),

        body:  Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ToggleButtons(
                        color: Color.fromARGB(200, 0, 0, 0),
                        selectedColor: Color.fromARGB(100, 0, 0, 0),
                        selectedBorderColor: Color.fromARGB(0, 0, 0, 0),
                        borderColor: Color.fromARGB(0, 0, 0, 0),
                        fillColor: Color.fromARGB(0, 0, 0, 0),
                        children: vendor.categories.map((category){return new Icon(
                            category.icon,
                            size: 70);}).toList(),
                        onPressed: (int index) {
/*
                          BlocProvider.of<ShopWindowCubit>(context)
                              .toggleCategory(index);*/
                        },
                        isSelected: isSelectedCategory,
                      ),
                    ),


              Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Scroll our Items List',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ))),
                        GenderChoice(
                          maleSelected: [false] ,
                          femaleSelected:  [false],
                        ),
                      ],
                    ),
                BlocBuilder<VendorBloc, VendorState>(
                  builder: (context, state) {
                    if (state is VendorStateGeneralError) {
                      return Column();
                    }

                    if (state is VendorStateSearched) {
                      return GoodTypologyList(goodsTypologies: state.result,
                           );
                    }

                    if (state is VendorStateLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return Center(
                        child: Text('Seleziona una categoria per iniziare'));
                  },
                )
              ],
            ),
          ),
    );
  }
}