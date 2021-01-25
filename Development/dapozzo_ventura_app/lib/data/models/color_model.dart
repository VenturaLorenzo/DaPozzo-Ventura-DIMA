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
  bool operator ==(other) {
    // TODO: implement ==
    return (other is ColorModel) && other.name == name;
  }
}
