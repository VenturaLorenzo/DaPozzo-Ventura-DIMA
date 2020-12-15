import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';

abstract class VendorEvent {}

class VendorEventCategorySearch extends VendorEvent {
  final CategoryModel category;
  final Vendor vendor;

  VendorEventCategorySearch(this.category, this.vendor);
}
class VendorEventGenderSearch extends VendorEvent {
  final String gender;
  final Vendor vendor;

  VendorEventGenderSearch(this.gender, this.vendor);
}
class VendorEventInit extends VendorEvent {
  final Vendor vendor;

  VendorEventInit(this.vendor);
}

class VendorEventReset extends VendorEvent {
  final Vendor vendor;

  VendorEventReset(this.vendor);
}
