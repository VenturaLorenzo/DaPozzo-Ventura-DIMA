import 'package:dapozzo_ventura_app/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

const apiKey =
    'pk_test_51H4SAHJvSqshfhLpmubpWCKQjTGwmHTar5rgB5L6aUNuxQx9QwdjDDTTeTztkaviBs8wk1yqriQOo8A55Ni2bfqA00keNsEllU';
const secretKey =
    'sk_test_51H4SAHJvSqshfhLpxOLFKvB5ByvMHbtrmYw8dDFCjlhGMWlDsTJ9GxYYowN23iY6G2VFzwyqkYSIEXi4KGgEfVAK00v88p3Naw';

class Globals {
  static UserModel currentUser;
  static bool isLogged;
  static GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  static String stripePk =
      "pk_test_51H4SAHJvSqshfhLpmubpWCKQjTGwmHTar5rgB5L6aUNuxQx9QwdjDDTTeTztkaviBs8wk1yqriQOo8A55Ni2bfqA00keNsEllU";

  // make this a singleton class
  Globals._privateConstructor();

  static final Globals instance = Globals._privateConstructor();
}
