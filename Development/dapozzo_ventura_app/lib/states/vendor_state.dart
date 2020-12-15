import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';


abstract class VendorState{}

class VendorStateInitial extends VendorState{
  final List<GoodTypologyModel> goodtypology;

  VendorStateInitial(this.goodtypology);
}
class VendorStateLoading extends VendorState{

}
class VendorStateSearched extends VendorState{
//final String search;
final List<GoodTypologyModel> result;

VendorStateSearched(this.result);
}
class VendorStateGeneralError extends VendorState{
  final String error;

  VendorStateGeneralError(this.error);
}