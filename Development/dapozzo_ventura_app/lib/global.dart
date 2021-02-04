import 'package:dapozzo_ventura_app/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Globals {
  static UserModel currentUser;
  static bool isLogged;
  static   GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  // make this a singleton class
  Globals._privateConstructor();

  static final Globals instance = Globals._privateConstructor();
}
