import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:dapozzo_ventura_app/global.dart';
import 'package:dio/dio.dart';

class Server {
  /*Future<String> createCheckout(double amount, String title) async {
    final auth = 'Basic ' + base64Encode(utf8.encode('$secretKey:'));
    final body = {
      'payment_method_types': ['card'],
      'line_items': [
        {
          'amount': (amount * 100).truncate(),
          'currency': 'eur',
          'name': title,
          'quantity': 1
        }
      ],
      'mode': 'payment',
      'success_url': 'http://localhost:8080/#/success',
      'cancel_url': 'http://localhost:8080/#/cancel',
    };

    try {
      final result = await Dio().post(
        "https://api.stripe.com/v1/checkout/sessions",
        data: body,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: auth},
          contentType: "application/x-www-form-urlencoded",
        ),
      );
      return result.data['id'];
    } on DioError catch (e, s) {
      print(e.response);
      throw e;
    }
  }*/

  Future<String> createCheckout(double amount, String title) async {
    try {
      final url = Globals.baseUrl +
          "Payments/CreateSession?amount=" +
          amount.toString() +
          "&title=" +
          title;
      final response = await http.get(url);
      final retVal = response.body.substring(1, response.body.length - 1);
      return retVal;
    } on Error catch (e) {
      print(e);
      throw e;
    }
  }
}
