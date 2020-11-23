import 'package:dapozzo_ventura_app/models/product_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';

abstract class VendorState{}

class VendorStateInitial extends VendorState{
  final List<Product> products;

  VendorStateInitial(this.products);
}
class VendorStateLoading extends VendorState{

}
class VendorStateSearched extends VendorState{
final String search;
final List<Product> result;

VendorStateSearched(this.search,this.result);
}
class VendorStateGeneralError extends VendorState{
  final String error;

  VendorStateGeneralError(this.error);
}