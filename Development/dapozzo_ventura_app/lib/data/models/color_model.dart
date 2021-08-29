class ColorModel {
  final int id;
  final String name;
  final String code;

  ColorModel({this.id, this.name, this.code});
  @override
  String toString() {
    return name;
  }

  @override
  bool operator ==(dynamic other) {
    return (other is ColorModel) && other.name == name;
  }

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(id: json["Id"], name: json["Name"], code: json["Code"]);
  }
}
