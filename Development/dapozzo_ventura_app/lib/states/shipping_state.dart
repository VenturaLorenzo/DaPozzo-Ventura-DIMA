import '../data/models/shippingAddr_model.dart';

abstract class ShippingState {}

List<ShippingAddrModel> adresses;

class ShippingInitState extends ShippingState {
  List<ShippingAddrModel> adresses;
  ShippingInitState();
}

class ShippingLoadingState extends ShippingState {
  ShippingLoadingState();
}

class ShippingLoadedState extends ShippingState {
  List<ShippingAddrModel> adresses;
  ShippingLoadedState(this.adresses);
}

class ShippingNoAddressState extends ShippingState {
  ShippingNoAddressState();
}
