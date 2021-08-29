class UserModel {
  final int id;
  final String email;
  final String name;
  final String surname;
  final String phone;
  final String image;
  final String password;

  UserModel(
      {this.id,
      this.email,
      this.name,
      this.surname,
      this.phone,
      this.image,
      this.password});

  @override
  String toString() {
    return name;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["Id"],
        email: json["Email"],
        name: json["Name"],
        surname: json["Surname"],
        phone: json["Phone"],
        image: json["Image"]);
  }
}
