import 'package:dapozzo_ventura_app/data/models/vendor_model.dart';

abstract class VendorEvent {}

class VendorEventSearch extends VendorEvent {
  final int gender;
  final List<int> categories;
  final int vendorId;

  VendorEventSearch(this.categories, this.gender, this.vendorId);
}

class VendorEventInit extends VendorEvent {
  final Vendor vendor;

  VendorEventInit(this.vendor);
}

class VendorEventReset extends VendorEvent {
  final Vendor vendor;

  VendorEventReset(this.vendor);
}
