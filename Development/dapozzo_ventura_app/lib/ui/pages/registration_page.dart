import 'package:dapozzo_ventura_app/data/models/user_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../global.dart';
import '../eQuip_appbar.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPage createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  bool _secureText = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordCheckController = TextEditingController();

  double textFieldHeight;
  var myController;
  var _formKey = GlobalKey<FormState>();
  var _checkPassword = 0;

  @override
  Widget build(BuildContext context) {
    textFieldHeight = MediaQuery.of(context).size.height / 10;
    return Scaffold(
        appBar: EquipAppBar(
          withMenu: false,
          title: 'Login',
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
                                return 'Attenzione, Mail non valida';
                              }
                              return null;
                            },
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "Inseririsci qui la tua Mail",
                              labelText: "Email",
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Attenzione, Nome non valido';
                              }
                              return null;
                            },
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Inseririsci qui il tuo nome",
                              labelText: "Nome",
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: textFieldHeight / 3.5),
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Attenzione, Cognome non valida';
                              }
                              return null;
                            },
                            controller: _surnameController,
                            decoration: InputDecoration(
                              hintText: "Inseririsci qui il tuo cognome",
                              labelText: "Cognome",
                              // errorText: null,
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: textFieldHeight / 3.5),
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Attenzione, Telefono non valida';
                              }
                              return null;
                            },
                            controller: _phoneController,
                            decoration: InputDecoration(
                              hintText:
                                  "Inseririsci qui il tuo numero di telefono",
                              labelText: "Telefono",
                              // errorText: null,
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: textFieldHeight / 3.5),
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
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Attenzione, Password non valida';
                              }
                              return null;
                            },
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: "Decidi la Password",
                              labelText: "Password",
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
                                return 'Attenzione, Password non valida';
                              }
                              if (_checkPassword != 1) {
                                return 'Attenzione, Password non coincide';
                              }
                              return null;
                            },
                            controller: _passwordCheckController,
                            decoration: InputDecoration(
                              hintText: "Conferma Password",
                              labelText: "Conferma Password",
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
                          "REGISTRATI",
                          style: TextStyle(
                            fontSize: textFieldHeight / 3,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_passwordController.text ==
                          _passwordCheckController.text) {
                        _checkPassword = 1;
                      }
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          UserRepository.newUser(
                                  _emailController.text,
                                  _passwordController.text,
                                  _nameController.text,
                                  _surnameController.text,
                                  _phoneController.text)
                              .then((value) => {
                                    if (value.id > 0)
                                      {
                                        Globals.currentUser = value,
                                        Globals.isLogged = true,
                                        Navigator.pushNamed(
                                          context,
                                          "/launch",
                                        ),
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Successo"),
                                                content: Text(
                                                    "Registrazione avvenuta correttamente"),
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
