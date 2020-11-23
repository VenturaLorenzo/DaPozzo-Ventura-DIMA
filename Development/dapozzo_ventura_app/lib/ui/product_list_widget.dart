import 'package:dapozzo_ventura_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

ProductList(this.products);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => Card(
        child: RaisedButton(child: Text(products[index].toString()),onPressed: (){
          Navigator.pushNamed(context, "/product" , arguments: products[index]);
        },),
      ),
    );
  }
}