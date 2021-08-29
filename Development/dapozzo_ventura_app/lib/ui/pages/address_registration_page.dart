import 'package:dapozzo_ventura_app/data/models/user_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/shippingAddr_repository.dart';
import 'package:dapozzo_ventura_app/data/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../global.dart';
import '../eQuip_appbar.dart';

class AddressRegistrationPage extends StatefulWidget {
  @override
  _AddressRegistrationPage createState() => _AddressRegistrationPage();
}

class _AddressRegistrationPage extends State<AddressRegistrationPage> {
  bool _secureText = true;
  TextEditingController _addressController = TextEditingController();
  TextEditingController _appartamentNumberController = TextEditingController();
  TextEditingController _streetAddressController = TextEditingController();
  TextEditingController _comuneController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _otherInfoController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  double textFieldHeight;
  var myController;

  @override
  Widget build(BuildContext context) {
    textFieldHeight = MediaQuery.of(context).size.height / 10;
    return Scaffold(
        appBar: EquipAppBar(
          withMenu: false,
          title: 'New Address',
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: textFieldHeight / 2,
                        child: Text('Inserisci i tuoi dati',
                            style: TextStyle(
                              fontSize: textFieldHeight / 3,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: textFieldHeight,
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Inserisci un indirizzo valido';
                              }
                              return null;
                            },
                            controller: _addressController,
                            decoration: InputDecoration(
                              hintText: "Inseririsci l'indirizzo",
                              labelText: "Indirizzo",
                              // errorText: null,
                              labelStyle: TextStyle(
                                fontSize: textFieldHeight / 3.5,
                                color: Colors.black54,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: textFieldHeight,
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
                          child: TextField(
                            controller: _appartamentNumberController,
                            decoration: InputDecoration(
                              hintText:
                                  "Inseririsci qui il numero di appartamento",
                              labelText: "Appartamento num",
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: textFieldHeight / 3.5),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                            ),
                            obscureText: _secureText,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: textFieldHeight,
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Attenzione, Civico non valido';
                              }
                              return null;
                            },
                            controller: _streetAddressController,
                            decoration: InputDecoration(
                              hintText: "Inseririsci il numero civico",
                              labelText: "Num Civico",
                              // errorText: null,
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: textFieldHeight / 3.5),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                            ),
                            obscureText: _secureText,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: textFieldHeight,
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Attenzione, Comune non valido';
                              }
                              return null;
                            },
                            controller: _comuneController,
                            decoration: InputDecoration(
                              hintText: "Inseririsci qui il Comune",
                              labelText: "Comune",
                              // errorText: null,
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: textFieldHeight / 3.5),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                            ),
                            obscureText: _secureText,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: textFieldHeight,
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Attenzione, Nazione non valida';
                              }
                              return null;
                            },
                            controller: _countryController,
                            decoration: InputDecoration(
                              hintText: "Inserisci qui la Nazione",
                              labelText: "Nazione",
                              // errorText: null,
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: textFieldHeight / 3.5),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                            ),
                            obscureText: _secureText,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: textFieldHeight,
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
                          child: TextField(
                            controller: _otherInfoController,
                            decoration: InputDecoration(
                              hintText: "Informazioni utili per la consegna",
                              labelText: "Altre Info",
                              // errorText: null,
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: textFieldHeight / 3.5),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                            ),
                            obscureText: _secureText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    child: Container(
                      height: textFieldHeight / 1.5,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 1, 136, 73),
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
                          "SALVA INDIRIZZO",
                          style: TextStyle(
                            fontSize: textFieldHeight / 3,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          ShippingAddrRepository.newShippingAddr(
                            _addressController.text,
                            _appartamentNumberController.text,
                            _streetAddressController.text,
                            _comuneController.text,
                            _countryController.text,
                            _otherInfoController.text,
                            Globals.currentUser.id,
                          )
                              .then((value) => {
                                    if (value.id > 0)
                                      {
                                        Navigator.pushNamed(
                                          context,
                                          "/cart",
                                        ),
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Successo"),
                                                content: Text(
                                                    "Indirizzo inserito correttamente"),
                                                actions: [
                                                  FlatButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Chiudi"))
                                                ],
                                              );
                                            })
                                      }
                                  })
                              .catchError((e) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Errore"),
                                    content: Text(e.message),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Chiudi"))
                                    ],
                                  );
                                }); // Future completes with 42.
                          });
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
