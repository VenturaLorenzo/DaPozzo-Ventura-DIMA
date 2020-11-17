import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';

abstract class VendorState{}

class VendorStateInitial extends VendorState{
  final Vendor vendorList;

  VendorStateInitial(this.vendorList);
}

class VendorStateSearched extends VendorState{
final String search;
final Vendor result;

VendorStateSearched(this.search,this.result);
}
class VendorStateGeneralError extends VendorState{
  final String error;

  VendorStateGeneralError(this.error);
}