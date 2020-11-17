import 'package:dapozzo_ventura_app/ui/vendor_page.dart';

abstract class MarketPlaceEvent {}

class MarketPlaceSearch extends MarketPlaceEvent {
  final String query;

  MarketPlaceSearch(this.query);
}
class MarketPlaceReset extends MarketPlaceEvent {


  MarketPlaceReset();
}
class MarketPlaceEnter extends MarketPlaceEvent {

  final VendorPage whereToEnter;

  MarketPlaceEnter(this.whereToEnter);

}
