import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:equatable/equatable.dart';

abstract class VendorState extends Equatable {}

class VendorStateInitial extends VendorState {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class VendorStateLoading extends VendorState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class VendorStateSearched extends VendorState {
//final String search;
  final List<GoodTypologyModel> goodTypologies;

  VendorStateSearched(this.goodTypologies);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class VendorStateGeneralError extends VendorState {
  final String error;

  VendorStateGeneralError(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
