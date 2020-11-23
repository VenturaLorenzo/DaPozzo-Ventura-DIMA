import 'package:dapozzo_ventura_app/models/vendor_model.dart';

import '../database_helper.dart';

class MarketPlace {
 //final List<Vendor> vendorsList;

// List get getVendors => vendorsList;


 //MarketPlace(this.vendorsList);

 static Future<List<Vendor>> getVendors() async{

  //prendo i negozi dal database
  final dbHelper = DatabaseHelper.instance;

  List<Vendor> vendors=  await dbHelper.queryAllVendors() ;
  return vendors;
}

 static Future<List<Vendor>> getVendorsWith(String query) async{

  //prendo i negozi dal database
  final dbHelper = DatabaseHelper.instance;
print(query);
  List<Vendor> vendors=  await dbHelper.queryVendorsWith(query) ;
  return vendors;
 }



}