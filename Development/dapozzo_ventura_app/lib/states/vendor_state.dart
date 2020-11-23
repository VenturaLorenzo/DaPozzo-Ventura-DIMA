import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';

abstract class VendorState{}

class VendorStateInitial extends VendorState{
  final List<String> products;

  VendorStateInitial(this.products);
}

class VendorStateSearched extends VendorState{
final String search;
final List<String> result;

VendorStateSearched(this.search,this.result);
}
class VendorStateGeneralError extends VendorState{
  final String error;

  VendorStateGeneralError(this.error);
}