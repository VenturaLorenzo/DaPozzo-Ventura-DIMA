import 'dart:convert';
import 'dart:io';
import 'package:dapozzo_ventura_app/data/models/order_model.dart';
import 'package:http/http.dart' as http;

import '../../global.dart';

class OrderApi {
  static Future<bool> sendOrder(OrderModel order) async {
    final url = Globals.baseUrl + "Users/SendConfirmationMail";

    Map<String, dynamic> args = {
      "UserId": order.userId,
      "OrderItems": order.orderItems
    };

    var body = json.encode(args);

    final response = await http.post(url,
        body: body, headers: {HttpHeaders.CONTENT_TYPE: "application/json"});

    return response.statusCode == 200;
  }
}
