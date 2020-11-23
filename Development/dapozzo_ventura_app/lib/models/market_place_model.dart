import 'package:dapozzo_ventura_app/models/vendor_model.dart';

import '../database_helper.dart';

class MarketPlace {



 static Future<List<Vendor>> getVendors() async{

  //prendo i negozi dal database
  final dbHelper = DatabaseHelper.instance;

  List<Vendor> vendors=  await dbHelper.queryAllVendors() ;
  return vendors;
}

 static Future<List<Vendor>> getVendorsWith(String query) async{

  //prendo i negozi dal database che hanno nel nome la stringa query
  final dbHelper = DatabaseHelper.instance;
print(query);
  List<Vendor> vendors=  await dbHelper.queryVendorsWith(query) ;
  return vendors;
 }



}