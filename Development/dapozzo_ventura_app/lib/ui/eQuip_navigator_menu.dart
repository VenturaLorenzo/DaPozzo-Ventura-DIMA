import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EquipNavigatorMenu extends StatelessWidget {
  final List<Widget> navigationTiles;

  EquipNavigatorMenu({this.navigationTiles});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children:<Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black54),
                accountName: Text("Account Name"),
                accountEmail: Text("Account Email"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://media.gqitalia.it/photos/5ec3ca47a63ee8cb452d9ce4/master/pass/Avatar.jpg"),
                ),
              ),


        ]+ navigationTiles,
          ),
        ]+[    Column(
          children: [
            ListTile(
              title: Text("Crea il tuo shop"),
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, "/profile");
              },
            ),
              ListTile(
                title: Text("Collabora con noi"),
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.pushNamed(context, "/profile");
                },
              ),
              ListTile(
                title: Text("Chi siamo"),
                onTap: () {
                  Navigator.pop(context);
                  //  Navigator.pushNamed(context, "/profile");
                },
              ),
              Divider(color: Colors.black87,height: 5,),
              ListTile(
                title: Text("Impostazioni"),leading:Icon(Icons.settings) ,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/settings");
                },
              ),
              Divider(color: Colors.black87,height: 5,),
          ],
        ),],
      ),
    );
  }
}
