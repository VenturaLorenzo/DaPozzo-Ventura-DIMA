class SportModel {
  final int id;
  final String icon;
  final String name;

  SportModel({this.id, this.icon, this.name});
  @override
  String toString() {
    return name;
  }
}
