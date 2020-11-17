class Vendor{

  List<String> products=["prodotto1","prodotto2","prodotto3"];


  List get getProducts=>products;
  Vendor(this.products);

  factory Vendor.getVendors(){

    //prendo i negozi dal database
    List<String> products= ["prodotto1","prodotto2","prodotto3"];
    return Vendor(products);
  }
  factory Vendor.getVendorsWith(String query){

    //prendo i negozi dal database
    List<String> vendors= ["prodotto1","prodotto2","prodotto3"];

    return Vendor(vendors.where((element) => element.contains(query)));
  }

}