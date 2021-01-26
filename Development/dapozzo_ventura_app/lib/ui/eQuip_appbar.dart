import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_icon.dart';

class EquipAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final double size;

  const EquipAppBar({Key key,@required this.title, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  AppBar(

        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: Builder(builder: (BuildContext context){

          return  IconButton(onPressed:() {
            Scaffold.of(context).openDrawer();
          } ,icon: Icon(Icons.menu,size: MediaQuery.of(context).size.width/16,));
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
    return Size.fromHeight(size);
  }
}
