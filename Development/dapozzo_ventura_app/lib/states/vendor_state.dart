import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';

abstract class VendorState {}

class VendorStateInitial extends VendorState {
  final List<GoodTypologyModel> goodTypologies;

  VendorStateInitial(this.goodTypologies);
}

class VendorStateLoading extends VendorState {}

class VendorStateSearched extends VendorState {
//final String search;
  final List<GoodTypologyModel> goodTypologies;

  VendorStateSearched(this.goodTypologies);
}

class VendorStateGeneralError extends VendorState {
  final String error;

  VendorStateGeneralError(this.error);
}
