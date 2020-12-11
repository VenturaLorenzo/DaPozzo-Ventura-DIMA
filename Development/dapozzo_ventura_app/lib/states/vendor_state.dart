import 'package:dapozzo_ventura_app/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/models/vendor_model.dart';
import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/ui/pages/vendor_page.dart';

abstract class VendorState{}

class VendorStateInitial extends VendorState{
  final List<GoodTypologyModel> goodtypology;

  VendorStateInitial(this.goodtypology);
}
class VendorStateLoading extends VendorState{

}
class VendorStateSearched extends VendorState{
final String search;
final List<GoodTypologyModel> result;

VendorStateSearched(this.search,this.result);
}
class VendorStateGeneralError extends VendorState{
  final String error;

  VendorStateGeneralError(this.error);
}