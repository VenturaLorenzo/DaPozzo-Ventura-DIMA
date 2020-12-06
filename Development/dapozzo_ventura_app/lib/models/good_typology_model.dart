class GoodTypology{

  final String name;
  final List<String> images;
  final int price;

  GoodTypology({ this.name,this.price,this.images});
  Map<String, dynamic> toMap() {
    return { 'name': price, 'size': price,'image' :images};
  }

  @override
  String toString() {
    return 'GoodTypology{ name: $name, price: $price, image: $images}';
  }
}