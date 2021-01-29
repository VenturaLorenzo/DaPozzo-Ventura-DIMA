import 'package:dapozzo_ventura_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_icon.dart';

class EquipAppBar extends StatelessWidget implements PreferredSize {
  final String title;

  const EquipAppBar({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(leading: new Container(),
      flexibleSpace: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
        child: Container(decoration: BoxDecoration(
            border: Border.all(color: Colors.white)
        ),
          height: MediaQuery.of(context).size.height/10,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Builder(builder: (BuildContext context) {
              return Container(height: MediaQuery.of(context).size.height/11 , decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)),
                child: FittedBox(
                  child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,

                      )),
                ),
              );
            }),Text( title,style: TextStyle(fontSize: MediaQuery.of(context).size.height/20,color: Colors.white),),
              Container(height: MediaQuery.of(context).size.height/11  , decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)),
                child: FittedBox(fit: BoxFit.fill,
                  child: CartIcon(
                  ),
                ),
              ),],
          ),
        ),
      ),
      backgroundColor: Colors.black87,
      //centerTitle: true,

     // title: Text(title),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(
        MediaQuery.of(navigatorKey.currentContext).size.width / 7);
  }
}
