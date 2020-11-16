class MarketPlace {
 final List<String> vendorList;

 List get getVendors => vendorList;


 MarketPlace(this.vendorList);

 factory MarketPlace.getVendors(){

  //prendo i negozi dal database
  List<String> vendors= ["negozio 1"," negozio 2", "negozio 3", "negozio 4"];
  return MarketPlace(vendors);
}



}