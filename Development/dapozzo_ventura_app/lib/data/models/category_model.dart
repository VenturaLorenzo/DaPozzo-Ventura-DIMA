class CategoryModel {
  final int id;
  final String icon;
  final String name;

  CategoryModel({this.icon, this.name, this.id});

  @override
  String toString() {
    return name;
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      icon: json["Icon"],
      id: json["Id"],
      name: json["Name"],
    );
  }
}
