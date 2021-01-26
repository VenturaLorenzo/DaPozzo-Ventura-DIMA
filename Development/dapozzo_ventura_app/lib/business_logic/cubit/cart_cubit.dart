import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/cart_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/states/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartModel cart = CartModel();


  CartCubit() : super(CartStateLoading()) {
   getCart();
  }



  Future<void> getCart() async {
    emit(CartCurrentState(cart));
  }

  Future<void> addGood(GoodModel good) async {
    emit(CartStateLoading());
    cart.addProduct(good);
    emit(CartCurrentState(cart));
  }

  Future<void> removeGood(GoodModel good) async {
    emit(CartStateLoading());
    cart.removeProduct(good);
    emit(CartCurrentState(cart));
  }

}