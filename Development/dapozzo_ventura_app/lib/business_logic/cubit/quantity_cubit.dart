import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/states/quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityStateUninitialized());

  Future<void> setQuantity(int q) async {
    emit(QuantityStateCurrent(q));
  }

  Future<void> reset() async {
    emit(QuantityStateUninitialized());
  }
}
