import 'package:dapozzo_ventura_app/data/models/user_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  double textFieldHeight;
  double paddingHeight;
  var myController;

  @override
  Widget build(BuildContext context) {
    textFieldHeight = MediaQuery.of(context).size.height / 10;
    paddingHeight = MediaQuery.of(context).size.height / 3;

    return Scaffold(
        appBar: EquipAppBar(
          withMenu: false,
          title: 'Login',
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: textFieldHeight / 2,
                        child: Text('Inserisci le Credenziali',
                            style: TextStyle(
                              fontSize: textFieldHeight / 3,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
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
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Inseririsci qui la tua Mail",
                            labelText: "Email",
                            // errorText: null,
                            labelStyle: TextStyle(
                              fontSize: textFieldHeight / 3,
                              color: Colors.black54,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
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
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: "Inseririsci qui la tua Password",
                            labelText: "Password",
                            // errorText: null,
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: textFieldHeight / 3),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                          ),
                          obscureText: _secureText,
                        ),
                      ),
                    ), /*
                    Container(
                      height: textFieldHeight,
                      child: TextButton(
                        onPressed: () async {
                          _login();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 10,
                            ),
                            Text(
                              "Accedi con Google",
                              style: TextStyle(
                                  fontSize: textFieldHeight / 4,
                                  color: Colors.lightBlueAccent,
                                  decoration: TextDecoration.underline),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            Container(
                              height: textFieldHeight / 2,
                              width: textFieldHeight / 2,
                              child: Image.network(
                                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                                  fit: BoxFit.cover),
                            ),
                          ],
                        ),
                      ),
                    )
                  */
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: FlatButton(
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
                          "LOGIN",
                          style: TextStyle(
                            fontSize: textFieldHeight / 3,
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
                                if (value.id > 0)
                                  {
                                    Globals.currentUser = value,
                                    Globals.isLogged = true,
                                    Navigator.pop(context)
                                  }
                                else
                                  {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Errore"),
                                            content: Text(
                                                "Username/Password errate"),
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
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextButton(
                    child: Center(
                      child: Text(
                        "Registrati",
                        style: TextStyle(
                          fontSize: textFieldHeight / 4,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/registration",
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _login() async {
    var _googleSignIn = Globals.googleSignIn;
    await _googleSignIn.signIn();
    if (_googleSignIn.currentUser != null) {
      Navigator.pop(context);
      Globals.currentUser = UserModel(
          name: _googleSignIn.currentUser.displayName,
          image: _googleSignIn.currentUser.photoUrl,
          email: _googleSignIn.currentUser.email);
      Globals.isLogged = true;
    }
  }
}
