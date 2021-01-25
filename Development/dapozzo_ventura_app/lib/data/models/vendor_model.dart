import 'package:dapozzo_ventura_app/data/models/category_model.dart';

class Vendor {
  final int id;
  final String name;
  final String desc;
  final String image;
   List<String> frontImages;
  final double rating;
  List<CategoryModel> categories;

  Vendor(
      {this.id,
      this.name,
      this.desc,
      this.image,
      this.frontImages,
      this.rating,
      this.categories});

  @override
  String toString() {
    // TODO: implement toString
    return "VENDOR -> id: $id , name: $name, desc: $desc, image: $image, rating: $rating, categories: $categories, images: $frontImages\n";
  }
}
