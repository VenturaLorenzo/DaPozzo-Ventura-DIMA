import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/data/models/order_model.dart';
import 'order_api.dart';

class OrderRepository {
  static Future<bool> sendOrder(OrderModel order) async {
    return OrderApi.sendOrder(order);
  }
}
