import 'package:dapozzo_ventura_app/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'package:dapozzo_ventura_app/ui/vendor_page.dart';

abstract class VendorState{}

class VendorStateInitial extends VendorState{
  final List<GoodTypology> goodtypology;

  VendorStateInitial(this.goodtypology);
}
class VendorStateLoading extends VendorState{

}
class VendorStateSearched extends VendorState{
final String search;
final List<GoodTypology> result;

VendorStateSearched(this.search,this.result);
}
class VendorStateGeneralError extends VendorState{
  final String error;

  VendorStateGeneralError(this.error);
}