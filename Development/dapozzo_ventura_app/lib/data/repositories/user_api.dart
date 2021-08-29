import 'dart:convert';
import 'dart:io';
import 'package:dapozzo_ventura_app/data/models/color_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:dapozzo_ventura_app/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../global.dart';

class UserApi {
  static Future<UserModel> login(String email, String password) async {
    final url = Globals.baseUrl + "Users/Login";
    Map<String, dynamic> args = {
      "email": email,
      "password": password,
    };
    var body = json.encode(args);
    try {
      final response = await http.post(url,
          body: body, headers: {HttpHeaders.CONTENT_TYPE: "application/json"});
      Map<String, dynamic> jsonUserRaw = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw new Exception(jsonUserRaw["ExceptionMessage"]);
      }

      var id = jsonUserRaw["Id"] as int;
      var email = jsonUserRaw["Email"] as String;
      var name = jsonUserRaw["Name"] as String;
      var surname = jsonUserRaw["Surname"] as String;
      var phone = jsonUserRaw["Phone"] as String;
      var image = jsonUserRaw["Image"] as String;

      return new UserModel(
          id: id,
          email: email,
          name: name,
          surname: surname,
          phone: phone,
          image: image);
    } on Error catch (e) {
      throw e;
    }
    /*on SocketException {
      throw Failure('no internet connection');
    } on HttpException {
      throw Failure('Internet connection too slow');
    } on FormatException {
      throw Failure('Generic Error');
    }*/
  }

  static Future<UserModel> newUser(String email, String password, String name,
      String surname, String phone) async {
    final url = Globals.baseUrl + "Users/Post";
    Map<String, dynamic> args = {
      "email": email,
      "password": password,
      "name": name,
      "surname": surname,
      "phone": phone,
      "image": "ProfiloIniziale.png",
    };
    var body = json.encode(args);
    try {
      final response = await http.post(url,
          body: body, headers: {HttpHeaders.CONTENT_TYPE: "application/json"});
      Map<String, dynamic> jsonUserRaw = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw new Exception(jsonUserRaw["ExceptionMessage"]);
      }

      var id = jsonUserRaw["Id"] as int;
      var email = jsonUserRaw["Email"] as String;
      var name = jsonUserRaw["Name"] as String;
      var surname = jsonUserRaw["Surname"] as String;
      var phone = jsonUserRaw["Phone"] as String;

      return new UserModel(
        id: id,
        email: email,
        name: name,
        surname: surname,
        phone: phone,
      );
    } on Error catch (e) {
      throw e;
    }
  }
}








/*
getData(data, apiUrl) async {
    var tempUrl = _url + apiUrl + await _getToken();
    Uri uri = Uri.parse(tempUrl);
    var fullUrl = uri.replace(queryParameters: data);
    var res;
    try {
      var response = await http.get(fullUrl, headers: _setHeaders()).timeout(
          const Duration(seconds: 60));
      print(response.statusCode);
      if (response.statusCode != 200) {
        res = {
          "success": false,
          "status": response.statusCode,
          "message": _returnResponse(response)
        };
      }
      else {
        res = response;
      }
    }
    on SocketException {
      throw FetchDataException('No Internet connection');
    }
    on TimeoutException catch (e) {
      res = {
        "success": false,
        "status": response.statusCode,
        "message": "Connection timeout"
      };
    } on Error catch (e) {
      print('Error: $e');
    }

    return res;
  }*/