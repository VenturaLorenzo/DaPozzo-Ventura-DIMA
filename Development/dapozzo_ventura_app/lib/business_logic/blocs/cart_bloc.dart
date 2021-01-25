import 'package:dapozzo_ventura_app/data/models/cart_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/states/cart_state.dart';
import 'package:bloc/bloc.dart';
import '../events/cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartModel cart= CartModel();

  @override
  CartState get initialState => CartCurrentState(cart);

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartAddEvent) {
      cart.addProduct(event.product);
      print(cart.toString());
      yield CartCurrentState(cart);
    } else {
      if (event is CartRemoveEvent) {
        cart.removeProduct(event.product);
        yield CartCurrentState(cart);
      } else {
        yield CartErrorState("Random error");
      }
    }
  }
}
