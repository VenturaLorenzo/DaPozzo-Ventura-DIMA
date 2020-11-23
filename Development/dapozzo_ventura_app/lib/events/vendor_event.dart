import 'package:dapozzo_ventura_app/models/vendor_model.dart';

abstract class VendorEvent {}

class VendorEventSearch extends VendorEvent {
  final String query;
  final Vendor vendor;

  VendorEventSearch(this.query, this.vendor);
}

class VendorEventInit extends VendorEvent {
  final Vendor vendor;

  VendorEventInit(this.vendor);
}

class VendorEventReset extends VendorEvent {
  final Vendor vendor;

  VendorEventReset(this.vendor);
}
