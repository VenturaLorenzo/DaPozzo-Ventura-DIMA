import 'package:bloc/bloc.dart';

import '../../data/models/shippingAddr_model.dart';
import '../../data/repositories/shippingAddr_repository.dart';
import '../../global.dart';
import '../../states/shipping_state.dart';

class ShippingCubit extends Cubit<ShippingState> {
  List<ShippingAddrModel> adresses;

  ShippingCubit() : super(ShippingInitState());

  Future<void> initialize() async {
    emit(ShippingLoadingState());
    final adresses =
        await ShippingAddrRepository.getAddrByUser(Globals.currentUser.id);
    if (adresses.isNotEmpty) {
      emit(ShippingLoadedState(adresses));
    } else {
      emit(ShippingNoAddressState());
    }
  }
}
