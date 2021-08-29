class ShippingAddrModel {
  final int id;
  final int userId;
  final String address;
  final String appartNum;
  final String otherInfo;
  final String comune;
  final String country;
  final String streetAddr;

  ShippingAddrModel({
    this.id,
    this.userId,
    this.address,
    this.appartNum,
    this.otherInfo,
    this.comune,
    this.country,
    this.streetAddr,
  });

  factory ShippingAddrModel.fromJson(json) {
    return ShippingAddrModel(
      id: json["Id"],
      address: json["Address"],
      appartNum: json["AppartamentNumber"],
      streetAddr: json["StreetAddr"],
      comune: json["Comune"],
      country: json["Country"],
      otherInfo: json["AddressInfo"],
      userId: json["UserId"],
    );
  }
}
