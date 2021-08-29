class SizeModel {
  final int id;
  final String name;

  SizeModel({this.id, this.name});

  @override
  String toString() {
    return name;
  }

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(
      id: json["id"],
      name: json["Name"],
    );
  }
}
