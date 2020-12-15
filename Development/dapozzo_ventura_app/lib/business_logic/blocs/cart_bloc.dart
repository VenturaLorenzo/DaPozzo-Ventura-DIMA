


import 'package:dapozzo_ventura_app/states/cart_state.dart';
import 'package:bloc/bloc.dart';

import '../events/cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<String> products=["ciao"];

  @override
  CartState get initialState => CartCurrentState(products);

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if(event is CartAddEvent){
      products.add(event.product);
      print("aggiunto elemento");
      yield CartCurrentState(products);

    }else{
      if(event is CartRemoveEvent)
      {products.remove(event.product);
      yield CartCurrentState(products);

      }else{
        yield CartErrorState("Random error");
      }}
  }
}