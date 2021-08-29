import 'package:dapozzo_ventura_app/business_logic/cubit/vendor_cubit.dart';
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
  final List<int> preselectedCategories;

  // IL VENDOR MI VIENE PASSATO DALLA HOME PAGE
  const VendorPage(
      {Key key, @required this.vendor, @required this.preselectedCategories})
      : super(key: key);

  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  List<bool> isSelectedCategory;
  List<bool> isSelectedGender = [false, false];
  List<CategoryModel> categories = [];
  double pageHeight = 0;
  double genderSelectionRowHeight = 0;

  @override
  void initState() {
    super.initState();
    categories = widget.vendor.categories;
    isSelectedCategory = List.generate(categories.length, (index) => false);

    for (var i = 0; i < categories.length; i++) {
      isSelectedCategory[i] =
          widget.preselectedCategories.contains(categories[i].id);
    }
  }

  @override
  Widget build(BuildContext context) {
    pageHeight = MediaQuery.of(context).size.height;
    genderSelectionRowHeight = pageHeight / 10;
    return Scaffold(
      appBar: EquipAppBar(
        withMenu: true,
        title: widget.vendor.name,
      ),
      drawer: EquipNavigatorMenu(
        navigationTiles: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, pageHeight / 80, 0, 0),
            child: FlatButton(
                child: Container(
                  height: pageHeight / 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(4.0, 4.0),
                          blurRadius: 5.0,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: Center(
                    child: Text(
                      "Torna a eQuip",
                      style: TextStyle(
                        fontSize: pageHeight / 40,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, pageHeight / 80, 0, 0),
            child: FlatButton(
                child: Container(
                  height: pageHeight / 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(4.0, 4.0),
                          blurRadius: 5.0,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: Center(
                    child: Text(
                      "Vai al tuo profilo",
                      style: TextStyle(
                        fontSize: pageHeight / 40,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/profile",
                      arguments: "Mario Rossi");
                }),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, pageHeight / 80, 0, 0),
            child: FlatButton(
                child: Container(
                  height: pageHeight / 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(4.0, 4.0),
                          blurRadius: 5.0,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: Center(
                    child: Text(
                      "Vai al profilo Shop",
                      style: TextStyle(
                        fontSize: pageHeight / 40,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/vendor_profile",
                      arguments: widget.vendor.name);
                }),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                "Categorie",
                style: TextStyle(
                  fontSize: genderSelectionRowHeight / 4,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ToggleButtons(
              color: Color.fromARGB(200, 0, 0, 0),
              selectedColor: Color.fromARGB(100, 0, 0, 0),
              selectedBorderColor: Color.fromARGB(0, 0, 0, 0),
              borderColor: Color.fromARGB(0, 0, 0, 0),
              fillColor: Colors.grey[200],
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image(
                    image: AssetImage(
                      "lib/assets/" + category.icon,
                    ),
                    height: pageHeight / 12,
                  ),
                );
              }).toList(),
              onPressed: (int index) {
                //CAMBIO L?ICONA VISIVAMENTE
                setState(() {
                  isSelectedCategory[index] = !isSelectedCategory[index];

                  //MANDO L'EVENTO
                  BlocProvider.of<VendorCubit>(context).search(
                      getSelectedCategories(),
                      getSelectedGender(),
                      widget.vendor.id);
                });
              },
              isSelected: isSelectedCategory,
            ),
          ),
          Container(
            height: genderSelectionRowHeight,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Seleziona cosa ti piace',
                          style: TextStyle(
                            fontSize: genderSelectionRowHeight / 4,
                            fontWeight: FontWeight.w300,
                          ))),
                  Container(
                      height: genderSelectionRowHeight / 1.5,
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
                              Text("Uomo",
                                  style: TextStyle(
                                    fontSize: genderSelectionRowHeight / 3,
                                    fontWeight: FontWeight.w300,
                                  ))
                            ],
                            borderColor: Color.fromARGB(0, 0, 0, 0),
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
                              Text("Donna",
                                  style: TextStyle(
                                    fontSize: genderSelectionRowHeight / 3,
                                    fontWeight: FontWeight.w300,
                                  ))
                            ],
                            borderColor: Color.fromARGB(0, 0, 0, 0),
                            fillColor: Color.fromRGBO(255, 45, 85, 1),
                            selectedBorderColor: Color.fromRGBO(255, 45, 85, 1),
                            selectedColor: Colors.white,
                            onPressed: (int index) {
                              setState(() {
                                swapGender(1);
                              });
                            },
                            isSelected: [isSelectedGender[1]])
                      ]))
                ]),
          ),
          BlocBuilder<VendorCubit, VendorState>(
            builder: (context, state) {
              if (state is VendorStateGeneralError) {
                return Column();
              }

              if (state is VendorStateSearched) {
                return GoodTypologyList(
                  goodsTypologies: state.goodTypologies,
                );
              }

              if (state is VendorStateLoading || state is VendorStateInitial) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                  ),
                );
              }

              return Center(
                  child: Text('Seleziona una categoria per iniziare'));
            },
          )
        ],
      ),
    );
  }

  void swapGender(int index) {
    //-------LOGICA CHE CAMBIA isSelectedGender--------

    isSelectedGender[index] = !isSelectedGender[index];
    isSelectedGender[(index + 1) % 2] = false;

    //-------LOGICA CHE MANDA L?EVENTO AL BLOC IN BASE A isSelectedGender-

    BlocProvider.of<VendorCubit>(context)
        .search(getSelectedCategories(), getSelectedGender(), widget.vendor.id);

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
