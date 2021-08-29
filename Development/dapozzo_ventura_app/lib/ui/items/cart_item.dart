import 'package:dapozzo_ventura_app/business_logic/cubit/cart_cubit.dart';
import 'package:dapozzo_ventura_app/business_logic/cubit/good_window_cubit.dart';
import 'package:dapozzo_ventura_app/data/models/good_model.dart';
import 'package:dapozzo_ventura_app/global.dart';
import 'package:dapozzo_ventura_app/ui/pages/good_window_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  final height;
  final GoodModel cartGood;

  const CartItem({Key key, this.cartGood, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(height / 24),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                offset: Offset(8.0, 8.0),
                blurRadius: 5.0,
                spreadRadius: 2,
              ),
            ]),
        height: height,
        child: Padding(
          padding: EdgeInsets.all(height / 24),
          child: FlatButton(
            onPressed: () {},
            child: Row(children: [
              SizedBox(
                  height: height * 11 / 12,
                  width: height,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2.5),
                    child: Image.network(
                      Globals.baseUrlImages + cartGood.images[0].image,
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                child: SizedBox(
                    height: height * 11 / 12,
                    child: Padding(
                        padding: EdgeInsets.all(height / 24),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                    height: height / 4,
                                    child: Text(
                                      cartGood.vendorName.name.toString(),
                                      style: TextStyle(
                                        fontSize: height / 6,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ),
                              Center(
                                child: SizedBox(
                                  height: height * 5 / 24,
                                  child: Text(
                                    cartGood.type.name,
                                    style: TextStyle(
                                      fontSize: height * 8 / 48,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: height * 9 / 24,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: height * 8 / 24,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Q.ty",
                                                style: TextStyle(
                                                    fontSize: height * 6 / 48),
                                              ),
                                              Text(
                                                cartGood
                                                    .getQuantity()
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: height * 3 / 24),
                                              )
                                            ]),
                                      ),
                                      Container(
                                        height: height * 8 / 24,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Size",
                                                style: TextStyle(
                                                    fontSize: height * 6 / 48),
                                              ),
                                              Text(
                                                cartGood.size,
                                                style: TextStyle(
                                                    fontSize: height * 3 / 24),
                                              )
                                            ]),
                                      ),
                                    ]),
                              ),
                            ]))),
              ),
              SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: height * 7 / 24,
                      child: Center(
                          child: Text(
                        cartGood.type.price.toString() + '€',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.green,
                            fontSize: height * 7 / 48),
                      )),
                    ),
                    InkWell(
                      child: SizedBox(
                          height: height * 8 / 24,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Icon(
                              Icons.delete,
                              color: Colors.red[400],
                            ),
                          )),
                      onTap: () {
                        BlocProvider.of<CartCubit>(context)
                            .removeGood(cartGood);
                      },
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
// return Card(child: Text(cartGood.type.name+ "("+cartGood.color.toString()+")"+"quantity" + cartGood.getQuantity().toString()+"size" + cartGood.size));
