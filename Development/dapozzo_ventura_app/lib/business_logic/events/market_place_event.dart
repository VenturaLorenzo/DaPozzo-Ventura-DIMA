import 'package:dapozzo_ventura_app/data/models/sport_model.dart';

abstract class MarketPlaceEvent {}

class MarketPlaceSearchCategory extends MarketPlaceEvent {
  final int categoryId;

  MarketPlaceSearchCategory(this.categoryId);
}

class MarketPlaceSearchSport extends MarketPlaceEvent {
  final SportModel sport;

  MarketPlaceSearchSport(this.sport);
}

class MarketPlaceSearchText extends MarketPlaceEvent {
  final String text;

  MarketPlaceSearchText(this.text);
}

class MarketPlaceReset extends MarketPlaceEvent {
  MarketPlaceReset();
}

class MarketPlaceInit extends MarketPlaceEvent {
} /*
class MarketPlaceSearchCategory extends MarketPlaceEvent {

  final String category ;

  MarketPlaceSearchCategory(this.category);



}*/
