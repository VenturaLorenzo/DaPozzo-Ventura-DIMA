import 'package:dapozzo_ventura_app/data/models/shippingAddr_model.dart';

abstract class ShippingState {}

List<ShippingAddrModel> adresses;

class ShippingInitState extends ShippingState {
  ShippingInitState();
}

class ShippingLoadedState extends ShippingState {
  ShippingLoadedState();
}
