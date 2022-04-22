import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/data/models/orderItems_model.dart';

class OrderModel {
  int userId;
  List<GoodModel> orderItems;

  OrderModel({
    this.userId,
    this.orderItems,
  });

  @override
  String toString() {
    return "ORDER -> userId: $userId, goods: $orderItems ";
  }

  factory OrderModel.fromJson(json) {
    return OrderModel(
      userId: json["UserId"],
      orderItems: json["OrderItems"],
    );
  }
}
