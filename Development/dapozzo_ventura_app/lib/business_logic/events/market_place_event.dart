import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/ui/pages/vendor_page.dart';

abstract class MarketPlaceEvent {}

class MarketPlaceSearch extends MarketPlaceEvent {
  final String query;


  MarketPlaceSearch(this.query);
}
class MarketPlaceReset extends MarketPlaceEvent {


  MarketPlaceReset();
}
class MarketPlaceInit extends MarketPlaceEvent{

}/*
class MarketPlaceSearchCategory extends MarketPlaceEvent {

  final String category ;

  MarketPlaceSearchCategory(this.category);



}*/
