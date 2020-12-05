import 'package:cart_test/cart_model.dart';

abstract class CartState{}

class CartCurrentState extends CartState{

  final List<String> products;

  CartCurrentState(this.products);



}
class CartStateLoading extends CartState{


}
class CartErrorState extends CartState{
   final String error;

  CartErrorState(this.error);

}