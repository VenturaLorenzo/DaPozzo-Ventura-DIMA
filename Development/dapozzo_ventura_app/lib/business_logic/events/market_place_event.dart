import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/ui/pages/vendor_page.dart';
import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';

abstract class MarketPlaceEvent {}

class MarketPlaceSearchCategory extends MarketPlaceEvent {
  final int categoryId;


  MarketPlaceSearchCategory(this.categoryId);
}

class MarketPlaceSearchSport extends MarketPlaceEvent {
  final Sport sport;


  MarketPlaceSearchSport(this.sport);
}

class MarketPlaceSearchText extends MarketPlaceEvent {
  final String text;


  MarketPlaceSearchText(this.text);
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
