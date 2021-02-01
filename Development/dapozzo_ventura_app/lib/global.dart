import 'package:dapozzo_ventura_app/data/models/user_model.dart';

class Globals {
  static UserModel currentUser;
  static bool isLogged;

  // make this a singleton class
  Globals._privateConstructor();

  static final Globals instance = Globals._privateConstructor();
}
