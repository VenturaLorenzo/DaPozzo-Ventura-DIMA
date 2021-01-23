class GoodTypologyModel {
  int id;
  int categoryId;
  int vendorId;
  int gender;
  String name;
  String description;
  String image;
  int price;
  String categoryName;

  GoodTypologyModel(
      {this.id,
      this.categoryId,
      this.vendorId,
      this.gender,
      this.name,
      this.description,
      this.image,
      this.price,
      this.categoryName});

  @override
  bool operator ==(other) {
    return (other is GoodTypologyModel)
        && other.id == id
        && other.gender == gender
        && other.name == name;
  }
  @override
  String toString() {
    // TODO: implement toString
    return "GOODTYPOLOGY -> id: $id , categoryId: $categoryId , vendorId: $vendorId, gender: $gender, name: $name, description : $description, price: $price, image : $image, categoryName: $categoryName";
  }
}
