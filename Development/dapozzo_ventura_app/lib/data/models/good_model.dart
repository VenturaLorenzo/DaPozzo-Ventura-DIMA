import 'dart:math';
import 'package:dapozzo_ventura_app/data/models/size_model.dart';

import 'color_model.dart';
import 'good_image_model.dart';
import 'good_typology_model.dart';
import 'vendor_model.dart';

class GoodModel {
  final GoodTypologyModel type;
  final ColorModel color;
  final List<GoodImageModel> images;
  final SizeModel size;
  final Vendor vendorName;
  int _quantity;

  GoodModel(
      {this.size,
      this.color,
      this.images,
      this.type,
      this.vendorName,
      int quantity}) {
    if (quantity <= 0) {
      throw ("QUANTITY LESS THAN 0");
    } else {
      _quantity = quantity;
    }
  }

  @override
  bool operator ==(other) {
    return (other is GoodModel) &&
        other.type == type &&
        other.color == color &&
        other.size == size;
  }

  @override
  String toString() {
    return "[GOOD ->  color : $color, images : $images, size: $size, quantity: $_quantity, type: $type]";
  }

  Map<String, dynamic> toJson() {
    return {
      "Quantity": this._quantity,
      "GoodTypologyId": this.type.id,
      "SizeId": this.size.id,
      "ColorId": this.color.id
    };
  }

  int getQuantity() {
    return _quantity;
  }

  void setQuantity(int newQuantity) {
    if (newQuantity >= 0) {
      _quantity = newQuantity;
    } else {
      throw ("TRYING TO SET A QUANTITY LESS THAN 0");
    }
  }

  void addOnePiece() {
    _quantity = _quantity + 1;
  }

  void removeOnePiece() {
    if (_quantity > 0) {
      _quantity = _quantity - 1;
    }
  }
}
