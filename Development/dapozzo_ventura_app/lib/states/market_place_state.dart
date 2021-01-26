import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';

abstract class MarketPlaceState {}

class MarketPlaceInitial extends MarketPlaceState {
  final List<Vendor> initialResult;
  final List<int> categories;

  MarketPlaceInitial(this.initialResult, this.categories);
}

class MarketPlaceSearched extends MarketPlaceState {
  final List<Vendor> result;
  final List<int> categories;

  MarketPlaceSearched(this.result, this.categories);
}


class MarketPlaceSearchFailed extends MarketPlaceState {
  final String error;

  MarketPlaceSearchFailed(this.error);
}


class MarketPlaceGeneralError extends MarketPlaceState {
  final String error;

  MarketPlaceGeneralError(this.error);
}

class MarketPlaceLoadingState extends MarketPlaceState {}
