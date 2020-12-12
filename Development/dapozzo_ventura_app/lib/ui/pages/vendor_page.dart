import 'package:dapozzo_ventura_app/blocs/vendor_bloc.dart';
import 'package:dapozzo_ventura_app/events/vendor_event.dart';
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
*/
class VendorPage extends StatefulWidget {
  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
   Vendor vendor;
List<bool>   isSelectedCategory ;

   @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }

  bool isSelectedMale = false;
  bool isSelectedFemale = true;
  @override
  Widget build(BuildContext context) {

    vendor = ModalRoute.of(context).settings.arguments;

    isSelectedCategory =
        List.generate(vendor.categories.length, (index) => false);

    return Scaffold(
      appBar: EquipAppBar(
        title: vendor.name,
      ),
      body: Padding(
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
                children: vendor.categories.map((category) {
                  return new Icon(category.icon, size: 70);
                }).toList(),
                onPressed: (int index) {
                  setState(() {
                    isSelectedFemale=false;
                  });
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
                    child: Text('Scroll our Item List',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ))),
      Padding(
        padding: EdgeInsets.all(8),
        child: Row(children: [
          ToggleButtons(
              children: [Text("Uomo")],
              fillColor: Color.fromRGBO(33, 150, 243, 1),
              selectedBorderColor: Color.fromRGBO(33, 150, 243, 1),
              selectedColor: Colors.white,
              onPressed: (int index) {
                      setState(() {
                        isSelectedMale=  !isSelectedMale;
                        print(isSelectedMale);

                      });
                //BlocProvider.of<ShopWindowCubit>(context).toggleGender(0);
              },
              isSelected: [isSelectedMale]),
          ToggleButtons(
              children: [Text("Donna")],
              fillColor: Color.fromRGBO(255, 45, 85, 1),
              selectedBorderColor: Color.fromRGBO(255, 45, 85, 1),
              selectedColor: Colors.white,
              onPressed: (int index) {
                setState(() {
                  isSelectedFemale=!isSelectedFemale;
                });
                //  BlocProvider.of<ShopWindowCubit>(context).toggleGender(1);
              },
              isSelected: [isSelectedFemale])
        ]),
      ),
              ],
            ),
            BlocBuilder<VendorBloc, VendorState>(
              builder: (context, state) {
                if (state is VendorStateGeneralError) {
                  return Column();
                }

                if (state is VendorStateSearched) {
                  return GoodTypologyList(
                    goodsTypologies: state.result,
                  );
                }
                if (state is VendorStateInitial) {
                  return GoodTypologyList(
                    goodsTypologies: state.goodtypology,
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
