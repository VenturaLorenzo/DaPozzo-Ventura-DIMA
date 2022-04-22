class OrderItemsModel {
  final int goodId;
  final int quantity;

  OrderItemsModel({
    this.goodId,
    this.quantity,
  });
  @override
  String toString() {
    return goodId.toString();
  }

  @override
  bool operator ==(dynamic other) {
    return (other is OrderItemsModel) && other.goodId == goodId;
  }

  factory OrderItemsModel.fromJson(Map<String, dynamic> json) {
    return OrderItemsModel(
      goodId: json["GoodId"],
      quantity: json["Quantity"],
    );
  }
}
