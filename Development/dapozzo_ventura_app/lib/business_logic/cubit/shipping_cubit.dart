import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/shippingAddr_repository.dart';
import 'package:dapozzo_ventura_app/states/shipping_state.dart';

import '../../global.dart';

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
