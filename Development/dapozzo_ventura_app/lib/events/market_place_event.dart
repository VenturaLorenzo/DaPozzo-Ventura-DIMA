import 'package:dapozzo_ventura_app/ui/vendor_page.dart';

abstract class MarketPlaceEvent {}

class MarketPlaceSearch extends MarketPlaceEvent {
  final String query;

  MarketPlaceSearch(this.query);
}

class MarketPlaceEnter extends MarketPlaceEvent {

  final Vendor whereToEnter;

  MarketPlaceEnter(this.whereToEnter);

}
