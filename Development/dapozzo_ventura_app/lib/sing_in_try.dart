import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    try{
      print(_googleSignIn.clientId);
      await _googleSignIn.signIn();
      if(_googleSignIn.currentUser != null){
      setState(() {
        _isLoggedIn = true;
      });}
    } catch (err){
      print(err);
    }
  }

  _logout(){
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: _isLoggedIn
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Image.network(_googleSignIn.currentUser.photoUrl, height: 50.0, width: 50.0,),
                Text(_googleSignIn.currentUser.displayName),
                OutlineButton( child: Text("Logout"), onPressed: (){
                  _logout();
                },)
              ],
            )
                : Center(
              child: OutlineButton(
                child: Text("Login with Google"),
                onPressed: () {
                  _login();
                },
              ),
            )),
      ),
    );
  }
}