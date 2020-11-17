abstract class VendorEvent{}

class VendorEventSearch extends VendorEvent{
final String query;

VendorEventSearch(this.query);
}

class VendorEventReset extends VendorEvent{



}