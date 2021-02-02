import 'package:dapozzo_ventura_app/ui/user_profile_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EquipNavigatorMenu extends StatelessWidget {
  final List<Widget> navigationTiles;
   double pageheight;
  double bottomContainerHeight;

  EquipNavigatorMenu({this.navigationTiles});

  @override
  Widget build(BuildContext context) {
    pageheight= MediaQuery.of(context).size.height;
    bottomContainerHeight=pageheight/5;
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                    UserProfileIcon(
                      height: pageheight / 3,
                    ),
                  ] +
                  navigationTiles,
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(pageheight/60, 0, 0, 0),
              child: Container(
                height: bottomContainerHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: bottomContainerHeight/4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Crea il tuo shop",
                            style: TextStyle(fontSize: bottomContainerHeight/8),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: bottomContainerHeight/4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Collabora con noi",
                            style: TextStyle(fontSize: bottomContainerHeight/8),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: bottomContainerHeight/4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Chi siamo",
                            style: TextStyle(fontSize: bottomContainerHeight/8),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: bottomContainerHeight/4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: pageheight / 24,
                                  width: pageheight / 24,
                                  child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Icon(Icons.settings)),
                                ),
                                Padding(
                                  padding:  EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Container(
                                      height: bottomContainerHeight/4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Impostazioni",
                                            style: TextStyle(
                                                fontSize: bottomContainerHeight/8),
                                          ),
                                        ],
                                      )),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
