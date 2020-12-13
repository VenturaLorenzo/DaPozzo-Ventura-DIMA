abstract class CartEvent{

}

class CartAddEvent extends CartEvent{
  final String product;

  CartAddEvent(this.product);


}
class CartRemoveEvent extends CartEvent{
  final String product;

  CartRemoveEvent(this.product);


}
class CartGetEvent extends CartEvent{

}