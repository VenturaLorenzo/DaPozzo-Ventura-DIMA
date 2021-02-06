import 'package:bloc/bloc.dart';
import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';
import 'package:dapozzo_ventura_app/data/repositories/shippingAddr_repository.dart';
import 'package:dapozzo_ventura_app/states/shipping_state.dart';

import '../../global.dart';

class ShippingCubit extends Cubit<ShippingState> {
  List<ShippingAddrModel> adresses;

  ShippingCubit() : super(ShippingInitState());

  Future<void> initialize() async {
    if (state is ShippingInitState) {
      print("init");
      adresses =
          await ShippingAddrRepository.getAddrByUser(Globals.currentUser.id);
    }
  }
}
