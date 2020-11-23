class Product{

  final String name;
  final String image;
  final int price;

  Product({ this.name,this.price,this.image});
  Map<String, dynamic> toMap() {
    return { 'name': price, 'size': price,'image' :image};
  }

  @override
  String toString() {
    return 'Product{ name: $name, price: $price, image: $image}';
  }
}