import 'package:bloc/bloc.dart';

import '../../states/quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityStateUninitialized());

  Future<void> setQuantity(int q) async {
    emit(QuantityStateCurrent(q));
  }

  Future<void> reset() async {

    emit(QuantityStateUninitialized());
  }
}
