import 'package:dapozzo_ventura_app/business_logic/blocs/vendor_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/events/vendor_event.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/states/vendor_state.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:dapozzo_ventura_app/ui/lists/goods_typology_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../eQuip_navigator_menu.dart';


class VendorPage extends StatefulWidget {


  final Vendor vendor;

  // IL VENDOR MI VIENE PASSATO DALLA HOME PAGE
  const VendorPage({Key key, @required this.vendor}) : super(key: key);

  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {


  // DEFINISCO LE VARIABILI SENZA ASSEGNARLE IN MODO CHE QUANDO ESEGUO IL METODO BUILD CON SETSTATE() NON VENGANO SOVRASCRITTE
  List<bool> isSelectedCategory;
  List<bool> isSelectedGender = [false, false];

  @override
  void initState() {
    super.initState();
    // GENERO UNA LISTA DI FALSE GRANDE QUANDO LA LISTA DI CATEGORIE CHE MI HA PASSATO LA HOMEPAGE
    isSelectedCategory =
        List.generate(widget.vendor.categories.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EquipAppBar(
        title: widget.vendor.name,
      ),
      drawer: EquipNavigatorMenu(
        navigationTiles:  [
                ListTile(
                  title: Text("Torna a eQuip"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
                Divider(color: Colors.black87,height: 5,),
                ListTile(
                  title: Text("Vai al tuo Profilo"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/profile");
                  },
                ),

                Divider(color: Colors.black87,height: 5,),
                ListTile(
                  title: Text("Vai al profilo dello Shop"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/vendor_profile",arguments: widget.vendor);
                  },
                ),
          Divider(color: Colors.black87,height: 5,),


        ],
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
                children: widget.vendor.categories.map((category) {
                  return new Icon(category.icon, size: 70);
                }).toList(),
                onPressed: (int index) {
                  //MANDO L'EVENTO
                  BlocProvider.of<VendorBloc>(context).add(VendorEventCategorySearch(widget.vendor.categories[index], widget.vendor));

                  //CAMBIO L?ICONA VISIVAMENTE
                  setState(() {
                    isSelectedCategory[index] = !isSelectedCategory[index];
                  });

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
                           swapGender("MALE");
                          });

                        },
                        isSelected: [isSelectedGender[0]]),
                    ToggleButtons(
                        children: [Text("Donna")],
                        fillColor: Color.fromRGBO(255, 45, 85, 1),
                        selectedBorderColor: Color.fromRGBO(255, 45, 85, 1),
                        selectedColor: Colors.white,
                        onPressed: (int index) {
                          setState(() {
                            swapGender("FEMALE");
                          });

                        },
                        isSelected: [isSelectedGender[1]])
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

  void swapGender(String gender) {

    //-------LOGICA CHE CAMBIA isSelectedGender--------
    if (gender == "MALE") {
      isSelectedGender[0] = !isSelectedGender[0];
      if (isSelectedGender[1]) {
        isSelectedGender[1] = false;
      }
    }
    if (gender == "FEMALE") {
      isSelectedGender[1] = !isSelectedGender[1];
      if (isSelectedGender[0]) {
        isSelectedGender[0] = false;
      }
    }

    //--------------------------------------------------


    //-------LOGICA CHE MANDA L?EVENTO AL BLOC IN BASE A isSelectedGender-

    if(isSelectedGender[0]){
      BlocProvider.of<VendorBloc>(context).add(
          VendorEventGenderSearch("MALE", widget.vendor));
    }
    if(isSelectedGender[1]){
      BlocProvider.of<VendorBloc>(context).add(
          VendorEventGenderSearch("FEMALE", widget.vendor));
    }
    if(!isSelectedGender[0] && !isSelectedGender[1]){
      BlocProvider.of<VendorBloc>(context).add(
          VendorEventGenderSearch("NONE", widget.vendor));
    }

    //----------------------------------------------------------
  }
}
