import 'package:dapozzo_ventura_app/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

const apiKey =
    'pk_live_51H4SAHJvSqshfhLpSdxYcWDhCwXU9BI7L9cQgqiVsBONcxbmIti9dvuw0SZ1ymB7oZZf71XLHLcni3KkI21ezkxv00gX03Ghjo';
const secretKey =
    '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';

class Globals {
  static UserModel currentUser;
  static bool isLogged;
  static GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  static String stripePk =
      "pk_test_51H4SAHJvSqshfhLpmubpWCKQjTGwmHTar5rgB5L6aUNuxQx9QwdjDDTTeTztkaviBs8wk1yqriQOo8A55Ni2bfqA00keNsEllU";
  static String baseUrl = "https://www.tannervancruz.com/Api/";
  static String baseUrlImages = "https://www.tannervancruz.com/images/";

  // make this a singleton class
  Globals._privateConstructor();

  static final Globals instance = Globals._privateConstructor();
}
