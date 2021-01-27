import 'package:dapozzo_ventura_app/ui/user_profile_icon.dart';
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
            children: <Widget>[
                  UserProfileIcon(),
                ] +
                navigationTiles,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Crea il tuo shop",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Collabora con noi",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Chi siamo",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              FlatButton(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.settings),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Impostazioni"),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/settings");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
