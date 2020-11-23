class Product{

  final String typology;
  final String color;
  final String size;
  final int quantity;

  Product({ this.typology,this.size, this.color, this.quantity});
  Map<String, dynamic> toMap() {
    return { 'typology': typology, 'size': size,'color' :color,'quantity':quantity};
  }

  @override
  String toString() {
    return 'Product{ typology: $typology, size: $size, color: $color, quantity : $quantity}';
  }
}