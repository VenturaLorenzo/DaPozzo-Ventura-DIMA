import 'package:dapozzo_ventura_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {


  @override
  Widget build(BuildContext context) {

    final Product product= ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Text("Description "),
          Row(
            children: [
              RaisedButton(child: Text("Buy with paypall"),onPressed: (){},),
              RaisedButton(child: Text("Buy with creditcard"),onPressed: (){},),
            ],
          ),
        ],
      ),
    );
  }
}
