class Vendor{

  //List<String> products=["prodotto1","prodotto2","prodotto3"];
final String name;
final String desc;

  //List get getProducts=>products;
   Vendor({this.name, this.desc});

  static List<String> getProducts(){

    //prendo i negozi dal database
    List<String> products= ["prodotto1","prodotto2","prodotto3"];
    return products;
  }
  static List<String> getProductsWith(String query){

    //prendo i negozi dal database
    List<String> products= ["prodotto1","prodotto2","prodotto3"];

    return products;


    //Vendor(vendors.where((element) => element.contains(query)).toList());
  }

}