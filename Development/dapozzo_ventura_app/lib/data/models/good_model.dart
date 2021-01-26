import 'dart:math';
import 'package:dapozzo_ventura_app/data/models/good_image_model.dart';
import 'package:dapozzo_ventura_app/ui/lists/good_images_list.dart';

import 'color_model.dart';
import 'good_typology_model.dart';

class GoodModel {
  final GoodTypologyModel type;
  final ColorModel color;
  final List<GoodImageModel> images;
  final String size;
  int _quantity;

  static GoodModel createFake(String name, String size, int quantity) {
    Random rnd = Random();
    return GoodModel(
        type: GoodTypologyModel.createFake(name),
        quantity: quantity,
        size: size,
        color: ColorModel(name: "green"));
     //   images: ["fake.jpg"]);
  }

  GoodModel({this.size, this.color, this.images, this.type, int quantity}) {
    if (images == []) {
      throw ("IMMAGINI NON CONFORMI, LISTA VUOTA");
    }
    String formatedSize = size.toLowerCase();
    List<String> possibleSizes = [
      "medium",
      "small",
      "large",
      "extralarge",
      "l",
      "s",
      "m",
      "xl",
      "xxl"
    ];
    if (!possibleSizes.contains(formatedSize)) {
      throw ("SIZE NON CONFORME O NON ESISTENTE: $formatedSize");
    }
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
    // TODO: implement toString
    return "GOOD ->  color : $color, images : $images, size: $size, quantity: $_quantity";
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
