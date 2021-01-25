import 'package:dapozzo_ventura_app/data/models/cart_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/data/models/good_typology_model.dart';
import 'package:test/test.dart';

void main() {
  group("CART", ()
  {
    test('Cart total should be 0 and product a empty list', () {
      final cart = CartModel();
      expect(cart.getTotal(), 0);
      expect(cart.getProducts(), []);
    });

    test("Cart total should be the good price * quantity ", () {
      final good = GoodModel.createFake("felpa","m",4);
      final cart = CartModel.fromProducts(products: [good]);

      expect(cart.getTotal(), good.type.price * good.getQuantity());
    });

    test("Good should be added to cart", (){
      final cart = CartModel();
      final good = GoodModel.createFake("felpa", "m", 4);

      cart.addProduct(good);
      expect(cart.getTotal(), good.type.price * good.getQuantity());
      expect(cart.getProducts()[0],good);
    });
    test("Only quantity should be changed and total updated", (){
      final cart = CartModel();
      final good = GoodModel.createFake("felpa", "m", 4);
      cart.addProduct(good);
      good.setQuantity(1);
      cart.addProduct(good);
      expect(cart.getTotal(), good.type.price*5);
      expect(cart.getProducts().length,1);
      expect(cart.getProducts()[0].getQuantity(), 5);
    });
    test("Good should be added and total updated", (){
      final cart = CartModel();
      final good = GoodModel.createFake("felpa", "m", 1);
      final anotherGood = GoodModel.createFake("giacca", "m", 3);
      cart.addProduct(good);
      cart.addProduct(anotherGood);
      expect(good!=anotherGood, true);
      expect(cart.getTotal(), good.type.price+ anotherGood.type.price*3);
      expect(cart.getProducts().length,2);
    });

  });
}