import 'package:dapozzo_ventura_app/business_logic/blocs/vendor_bloc.dart';
import 'package:dapozzo_ventura_app/business_logic/events/vendor_event.dart';
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
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
  List<CategoryModel> categories = [];
  @override
  void initState() {
    super.initState();
    categories = widget.vendor.categories;
    // GENERO UNA LISTA DI FALSE GRANDE QUANDO LA LISTA DI CATEGORIE CHE MI HA PASSATO LA HOMEPAGE
    isSelectedCategory = List.generate(categories.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EquipAppBar(
        title: widget.vendor.name,
      ),
      drawer: EquipNavigatorMenu(
        navigationTiles: [
          ListTile(
            title: Text("Torna a eQuip"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          Divider(
            color: Colors.black87,
            height: 5,
          ),
          ListTile(
            title: Text("Vai al tuo Profilo"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/profile");
            },
          ),
          Divider(
            color: Colors.black87,
            height: 5,
          ),
          ListTile(
            title: Text("Vai al profilo dello Shop"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/vendor_profile",
                  arguments: widget.vendor);
            },
          ),
          Divider(
            color: Colors.black87,
            height: 5,
          ),
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
                children: categories.map((category) {
                  return
                      // SizedBox(
                      //   child: new Image.asset(category.icon),
                      //   height: 70,
                      // );
                      Icon(Icons.ac_unit, size: 70);
                }).toList(),
                onPressed: (int index) {
                  //CAMBIO L?ICONA VISIVAMENTE
                  setState(() {
                    isSelectedCategory[index] = !isSelectedCategory[index];

                    //MANDO L'EVENTO
                    BlocProvider.of<VendorBloc>(context).add(VendorEventSearch(
                        getSelectedCategories(),
                        getSelectedGender(),
                        widget.vendor.id));
                  });
                },
                isSelected: isSelectedCategory,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Scroll our Item List',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ))),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(4.0, 4.0),
                              blurRadius: 5.0,
                              spreadRadius: 1,
                            ),
                          ]),
                      child: Row(children: [
                        ToggleButtons(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text("Uomo",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                      )))
                            ],
                            borderColor: Colors.grey[200],
                            fillColor: Color.fromRGBO(33, 150, 243, 1),
                            selectedBorderColor:
                                Color.fromRGBO(33, 150, 243, 1),
                            selectedColor: Colors.white,
                            onPressed: (int index) {
                              setState(() {
                                swapGender(0);
                              });
                            },
                            isSelected: [isSelectedGender[0]]),
                        ToggleButtons(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text("Donna",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    )),
                              )
                            ],
                            borderColor: Colors.grey[200],
                            fillColor: Color.fromRGBO(255, 45, 85, 1),
                            selectedBorderColor: Color.fromRGBO(255, 45, 85, 1),
                            selectedColor: Colors.white,
                            onPressed: (int index) {
                              setState(() {
                                swapGender(1);
                              });
                            },
                            isSelected: [isSelectedGender[1]])
                      ])))
            ]),
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

  void swapGender(int index) {
    //-------LOGICA CHE CAMBIA isSelectedGender--------

    isSelectedGender[index] = !isSelectedGender[index];
    isSelectedGender[(index + 1) % 2] = false;

    //-------LOGICA CHE MANDA L?EVENTO AL BLOC IN BASE A isSelectedGender-

    BlocProvider.of<VendorBloc>(context).add(VendorEventSearch(
        getSelectedCategories(), getSelectedGender(), widget.vendor.id));
    //----------------------------------------------------------
  }

  int getSelectedGender() {
    var retVal = -1;
    if (isSelectedGender[0]) {
      retVal = 0;
    }
    if (isSelectedGender[1]) {
      retVal = 1;
    }
    return retVal;
  }

  List<int> getSelectedCategories() {
    var selectedCategories = new List<int>();
    for (var i = 0; i < this.isSelectedCategory.length; i++) {
      if (this.isSelectedCategory[i]) {
        selectedCategories.add(this.categories[i].id);
      }
    }

    return selectedCategories;
  }
}
