import 'package:dapozzo_ventura_app/data/models/good_model.dart';

class CartModel {
  List<GoodModel> products=[];
  double total=0;

  CartModel({this.products}) {
    total = calculateTotal(products);
  }
  @override
  String toString() {
    // TODO: implement toString
    String cartToString="";
    cartToString= cartToString+" Total : "+ total.toString()+"\n";
    cartToString= cartToString+" Items : "+ "\n";


    products.forEach((element) { cartToString=cartToString + element.toString()+"\n";});
    return cartToString;
  }

  void addProduct(GoodModel product) {
    print(product.quantity);
    if (products.contains(product)) {
      GoodModel toChange = products[products.indexOf(product)];
      int currentQuantity = toChange.quantity;
      int newQuantity = product.quantity;
      print(currentQuantity);
      print(newQuantity);
      toChange.quantity=currentQuantity + newQuantity;
      print(toChange);
      products[products.indexOf(product)]= toChange;
    } else {
      GoodModel newProduct= new GoodModel(color: product.color,quantity: product.quantity,size: product.size,type: product.type);

      products.add(newProduct);
    }
    total = calculateTotal(products);
  }

  void removeProduct(GoodModel product) {
    if (products.contains(product)) {
      GoodModel toChange = products[products.indexOf(product)];
      if (toChange.quantity <= product.quantity) {
        products.remove(product);
      } else {
        int currentQuantity = toChange.quantity;
        int toRemoveQuantity = product.quantity;
        toChange.quantity = currentQuantity - toRemoveQuantity;
      }
    } else {
      throw("TRYING TO REMOVE FROM CART AN OBJECT THAT IS NOT PRESENT");
    }
    total = calculateTotal(products);
  }

  double calculateTotal(List<GoodModel> products) {
    double tot = 0;
    products.forEach((product) {
      tot = tot + (product.type.price * product.quantity);
    });
    return tot;
  }
}
