import 'package:dapozzo_ventura_app/data/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../global.dart';
import '../eQuip_appbar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  var myController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EquipAppBar(
          withMenu: false,
          title: 'Login',
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
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
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Inseririsci qui la tua Mail",
                      labelText: "Email",
                      // errorText: null,
                      labelStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
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
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Inseririsci qui la tua Password",
                      labelText: "Password",
                      // errorText: null,
                      labelStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                    obscureText: _secureText,
                  ),
                ),
              ),
              FlatButton(
                child: Container(
                  height: 40,
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
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  UserRepository.checkCredential(
                          _emailController.text, _passwordController.text)
                      .then((value) => {
                            if (value)
                              {
                                UserRepository.getUserByMail(
                                        _emailController.text)
                                    .then((value2) => {
                                          Globals.currentUser = value2,
                                          Globals.isLogged = true,
                                          Navigator.pop(context)
                                        }),
                              }
                            else
                              {
                                showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      title: Text("Errore"),
                                      content: Text("Username/Password errate"),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Chiudi"))
                                      ],
                                    ))
                              }
                          });
                },
              ),
            ],
          ),
        ));
  }
}
