import 'package:dapozzo_ventura_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_icon.dart';

class EquipAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final bool withMenu;

  const EquipAppBar({Key key, @required this.title, @required this.withMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: new Container(),
      flexibleSpace: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Builder(builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height / 11,
                child: FittedBox(
                  child: (withMenu)
                      ? IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ))
                      : IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                ),
              );
            }),
            Text(
              title,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 30,
                  color: Colors.white),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 11,
              child: FittedBox(
                fit: BoxFit.fill,
                child: CartIcon(),
              ),
            ),
          ],
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
