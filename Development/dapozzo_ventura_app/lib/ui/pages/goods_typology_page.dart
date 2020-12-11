import 'package:dapozzo_ventura_app/blocs/cart_bloc.dart';
import 'package:dapozzo_ventura_app/events/cart_event.dart';
import 'package:dapozzo_ventura_app/models/good_model.dart';
import 'package:dapozzo_ventura_app/models/good_typology_model.dart';
import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'file:///C:/Users/darkp/OneDrive/Desktop/Gitkraken/DaPozzo-Ventura-DIMA/Development/dapozzo_ventura_app/lib/ui/lists/good_images_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoodTypologyPage extends StatefulWidget {
  @override
  _GoodTypologyPageState createState() => _GoodTypologyPageState();
}

class _GoodTypologyPageState extends State<GoodTypologyPage> {
  CartBloc _cartBloc;
  List<bool> isSelected = [true, false, false];
  final List<Color> colori=[Colors.red,Colors.blue,Colors.yellow];

  // _GoodTypologyPageState({this.GoodTypology});
  @override
  Widget build(BuildContext context) {
    final GoodTypologyModel good_typology =
        ModalRoute.of(context).settings.arguments;
    final List<Good> goods = [
      Good(
          color: "red",
          images: ["image2.jpg", "image2.jpg"],
          quantity: 2,
          size: "M"),
      Good(
          color: "blue",
          images: ["image2.jpg", "image2.jpg"],
          quantity: 2,
          size: "M"),
      Good(
          color: "red",
          images: ["image2.jpg", "image2.jpg"],
          quantity: 2,
          size: "M"),
      Good(
          color: "yellow",
          images: ["image2.jpg", "image2.jpg"],
          quantity: 2,
          size: "M")
    ];
    _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: EquipAppBar(
        title: good_typology.name,
      ),
      body: Column(
        children: [
          /*TextField(
            onSubmitted: (typedText) {
              _vendorBloc.add(VendorEventSearch(typedText ,vendor));
            },
            decoration: InputDecoration(labelText: "Search"),
          ),*/
          SizedBox(
            height: 15,
          ),
          RaisedButton(
            child: Text("Add to cart"),
            onPressed: () {
              _cartBloc.add(CartAddEvent(good_typology.name));
            },
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Size"),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              Column(
                children: [
                  Text("Q.ty"),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              Column(
                children: [
                  Text("Price"),
                  SizedBox(
                    height: 7,
                  ),
                  Text("mom"),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
             children: colori.map((color) {
               int x=colori.indexOf(color);
                if (isSelected[x] == true) {
                  return GestureDetector(onTap:(){setState(() {
                    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                      if (buttonIndex == x) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });} ,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 35.0,
                        height: 35.0,
                        decoration: new BoxDecoration(border: Border.all(color:Colors.black54,width: 5),
                          color: color ,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                } else {
                  return GestureDetector(onTap:(){setState(() {
                    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                      if (buttonIndex == x) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });} ,
                    child: Padding(padding:const EdgeInsets.all(4.0),
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: new BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                }
              }).toList(),
            ),
          ),

          Expanded(
            child: Container(
              child: GoodImagesList(
                images: good_typology.images,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
