import 'package:dapozzo_ventura_app/data/models/good_model.dart';

class CartModel {
  List<GoodModel> _products;
  double _total;

  CartModel() {
    _products = [];
    _total = 0;
  }

  CartModel.fromProducts({List<GoodModel> products}) {
    _products = products;
    calculateTotal();
  }

  @override
  String toString() {
    // TODO: implement toString
    String cartToString = "";
    cartToString = cartToString + " Total : " + _total.toString() + "\n";
    cartToString = cartToString + " Items : " + "\n";

    _products.forEach((element) {
      cartToString = cartToString + element.toString() + "\n";
    });
    return cartToString;
  }

  void addProduct(GoodModel product) {
    if (_products.contains(product)) {
      GoodModel toChange = _products[_products.indexOf(product)];
      int currentQuantity = toChange.getQuantity();
      int newQuantity = product.getQuantity();
      toChange.setQuantity(currentQuantity + newQuantity);
      _products[_products.indexOf(product)] = toChange;
    } else {
        GoodModel newProduct = new GoodModel(
          color: product.color,
          quantity: product.getQuantity(),
          size: product.size,
          type: product.type);

      _products.add(newProduct);
    }
    calculateTotal();
  }

  void removeProduct(GoodModel product) {
    if (_products.contains(product)) {
      GoodModel toChange = _products[_products.indexOf(product)];
      if (toChange.getQuantity() <= product.getQuantity()) {
        _products.remove(product);
      } else {
        int currentQuantity = toChange.getQuantity();
        int toRemoveQuantity = product.getQuantity();
        toChange.setQuantity(currentQuantity - toRemoveQuantity);
      }
    } else {
      throw ("TRYING TO REMOVE FROM CART AN OBJECT THAT IS NOT PRESENT");
    }
    calculateTotal();
  }

  List<GoodModel> getProducts() {
    return _products;
  }

  double getTotal() {
    return _total;
  }

  calculateTotal() {
    double tot = 0;
    _products.forEach((product) {
      tot = tot + (product.type.price * product.getQuantity());
    });
    if (tot >= 0) {
      _total = tot;
    } else {
      throw ("TOTALE LESS THAN 0");
    }
  }
}
