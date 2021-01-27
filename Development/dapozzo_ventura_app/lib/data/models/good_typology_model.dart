import 'dart:math';

class GoodTypologyModel {
  final int id;
  final int categoryId;
  final int vendorId;
  final String vendorName;
  final int gender;
  final String name;
  final String description;
  final String image;
  final int price;
  final String categoryName;

  static GoodTypologyModel createFake(String name) {
    Random rnd = Random();
    return GoodTypologyModel(
        id: rnd.nextInt(20),
        price: rnd.nextInt(200),
        name: name,
        gender:( rnd.nextInt(3) - 1),
        categoryId: rnd.nextInt(10),
        image: "fake.jpg",
        categoryName: "fakeCategory",
        description: "fake desc",
        vendorId: rnd.nextInt(10));

  }

  GoodTypologyModel(
      {this.id,this.vendorName,
      this.categoryId,
      this.vendorId,
      this.gender,
      this.name,
      this.description,
      this.image,
      this.price,
      this.categoryName}) {
    if (id <= 0) {
      throw ("ID NON CONFORME PER CREAZIONE GOOD TYPOLOGY : MINORE DI ZERO ");
    }
    if (categoryId < 0) {
      throw ("categoryId NON CONFORME PER CREAZIONE GOOD TYPOLOGY : MINORE DI ZERO ");
    }
    if (vendorId < 0) {
      throw ("vendorId NON CONFORME PER CREAZIONE GOOD TYPOLOGY : MINORE DI ZERO ");
    }
    if (gender <-1 || gender > 1) {
      throw ("gender $gender NON CONFORME PER CREAZIONE GOOD TYPOLOGY : DIVERSO DA -1 0 1 ");
    }
    if (description.length > 300) {
      throw ("descrizione NON CONFORME PER CREAZIONE GOOD TYPOLOGY : LENGTH > 300 ");
    }
    if (image == null) {
      throw ("image NON CONFORME PER CREAZIONE GOOD TYPOLOGY : NULL ");
    }
    if (price <= 0) {
      throw ("price NON CONFORME PER CREAZIONE GOOD TYPOLOGY : PREZZO < 0 ");
    }
  }

  @override
  bool operator ==(other) {
    return (other is GoodTypologyModel) &&
        other.id == id &&
        other.gender == gender &&
        other.name == name &&
        other.price == price &&
        other.image == image &&
        other.description == description &&
        other.categoryId == categoryId;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "GOODTYPOLOGY -> id: $id , categoryId: $categoryId , vendorId: $vendorId, gender: $gender, name: $name, description : $description, price: $price, image : $image, categoryName: $categoryName";
  }
}
