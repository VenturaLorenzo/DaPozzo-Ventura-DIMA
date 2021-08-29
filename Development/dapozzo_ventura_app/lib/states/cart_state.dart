import '../data/models/cart_model.dart';

abstract class CartState {}

class CartCurrentState extends CartState {
  final CartModel cart;

  CartCurrentState(this.cart);
}

class CartStateLoading extends CartState {}

class CartErrorState extends CartState {
  final String error;

  CartErrorState(this.error);
}
