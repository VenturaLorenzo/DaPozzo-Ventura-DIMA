import 'package:dapozzo_ventura_app/data/models/good_image_model.dart';

import 'category_model.dart';

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

  factory Vendor.fromJson(Map<String, dynamic> json) {
    var v = Vendor(
      id: json["Id"],
      name: json["Name"],
      desc: json["Description"],
      image: json["Image"],
      rating: json["Rating"],
    );

    var listaCat = json["Categories"] as List<dynamic>;
    v.categories = new List<CategoryModel>();
    for (var cat in listaCat) {
      v.categories.add(CategoryModel.fromJson(cat));
    }

    var listaFrontImages = json["FrontImages"] as List<dynamic>;
    v.frontImages = new List<String>();
    for (var image in listaFrontImages) {
      v.frontImages.add(image);
    }

    return v;
  }
}
