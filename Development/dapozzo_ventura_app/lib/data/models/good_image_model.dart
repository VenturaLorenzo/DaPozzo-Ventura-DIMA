class GoodImageModel {
  final int id;
  final int typologyId;
  final int colorId;
  final String image;

  GoodImageModel({this.id, this.typologyId, this.colorId, this.image});

  @override
  String toString() {
    return "GOODIMAGE -> id: $id, typology: $typologyId color : $colorId, size: $image,";
  }

  factory GoodImageModel.fromJson(json) {
    return GoodImageModel(
        id: json["Id"],
        colorId: json["ColorId"],
        image: json["Image"],
        typologyId: json["TypologyId"]);
  }
}
