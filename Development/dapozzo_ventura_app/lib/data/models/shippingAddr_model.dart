class ShippingAddrModel {
  final int id;
  final int userId;
  final String address;
  final String appartNum;
  final String otherInfo;
  final String comune;
  final String country;
  final int cap;

  ShippingAddrModel({
    this.id,
    this.userId,
    this.address,
    this.appartNum,
    this.otherInfo,
    this.comune,
    this.country,
    this.cap,
  });
}
