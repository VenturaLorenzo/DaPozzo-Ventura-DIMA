class MarketPlace {
 List<String> vendorsList=["negozio 1"," negozio 2", "negozio 3", "negozio 4"];

 List get getVendors => vendorsList;


 MarketPlace(this.vendorsList);

 factory MarketPlace.getVendors(){

  //prendo i negozi dal database
  List<String> vendors= ["negozio 1"," negozio 2", "negozio 3", "negozio 4"];
  return MarketPlace(vendors);
}



}