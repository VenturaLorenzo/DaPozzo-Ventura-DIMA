import 'package:dapozzo_ventura_app/data/models/good_model.dart';

abstract class CartEvent{

}

class CartAddEvent extends CartEvent{
  final GoodModel product;

  CartAddEvent(this.product);


}
class CartRemoveEvent extends CartEvent{
  final GoodModel product;

  CartRemoveEvent(this.product);


}
class CartGetEvent extends CartEvent{

}