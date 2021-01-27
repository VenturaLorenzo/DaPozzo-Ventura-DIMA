import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';
import 'package:equatable/equatable.dart';

abstract class MarketPlaceState extends Equatable {}

class MarketPlaceInitial extends MarketPlaceState {


  MarketPlaceInitial();

  @override
  // TODO: implement props
  List<Object> get props =>[];}


class MarketPlaceSearched extends MarketPlaceState {
  final List<Vendor> result;
  final List<int> categories;

  MarketPlaceSearched(this.result, this.categories);

  @override
  // TODO: implement props
  List<Object> get props => [this.categories];
}


class MarketPlaceSearchFailed extends MarketPlaceState {
  final String error;

  MarketPlaceSearchFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [this.error];
}


class MarketPlaceGeneralError extends MarketPlaceState {
  final String error;

  MarketPlaceGeneralError(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MarketPlaceLoadingState extends MarketPlaceState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
