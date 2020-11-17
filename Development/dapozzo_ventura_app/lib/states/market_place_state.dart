import 'package:dapozzo_ventura_app/models/market_place_model.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';

abstract class MarketPlaceState {}

class MarketPlaceInitial extends MarketPlaceState {
final MarketPlace  initialResult;

MarketPlaceInitial(this.initialResult);
}

class MarketPlaceSearched  extends MarketPlaceState{
  final MarketPlace result;
  final String search;
  MarketPlaceSearched(this.result, this.search);
}

class MarketPlaceInside extends MarketPlaceState{
final VendorPage shop;

MarketPlaceInside(this.shop);
}

class MarketPlaceSearchFailed  extends MarketPlaceState{
  final String error;

  MarketPlaceSearchFailed(this.error);

}

class MarketPlaceEntranceFailed  extends MarketPlaceState{
  final String error;

  MarketPlaceEntranceFailed(this.error);

}
class MarketPlaceGeneralError  extends MarketPlaceState{
  final String error;

  MarketPlaceGeneralError(this.error);

}
