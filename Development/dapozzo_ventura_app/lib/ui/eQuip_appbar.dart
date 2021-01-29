import 'package:dapozzo_ventura_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_icon.dart';

class EquipAppBar extends StatelessWidget implements PreferredSize {
  final String title;

  const EquipAppBar({Key key,@required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  AppBar(

        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: Builder(builder: (BuildContext context){

          return  IconButton(onPressed:() {
            Scaffold.of(context).openDrawer();
          } ,icon: Icon(Icons.menu,size: MediaQuery.of(context).size.width/14,));
        }),
        actions: [
          CartIcon(),
        ],
        title: Text(title),

    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(MediaQuery.of(navigatorKey.currentContext).size.width / 7);
  }
}
