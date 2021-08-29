class SportModel {
  final int id;
  final String icon;
  final String name;

  SportModel({this.id, this.icon, this.name});
  @override
  String toString() {
    return name;
  }

  factory SportModel.fromJson(Map<String, dynamic> json) {
    return SportModel(
      icon: json["Icon"],
      id: json["Id"],
      name: json["Name"],
    );
  }
}
