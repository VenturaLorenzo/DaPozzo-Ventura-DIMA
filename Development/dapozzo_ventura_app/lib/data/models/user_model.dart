class UserModel {
  final int id;
  final String email;
  final String name;
  final String surname;
  final int phone;
  final String image;
  final String password;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.surname,
    this.phone,
    this.image,
    this.password,
  });

  @override
  String toString() {
    return name;
  }
}
