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
}