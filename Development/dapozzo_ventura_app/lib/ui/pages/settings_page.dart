import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EquipAppBar(
        title: "Impostazioni",
        withMenu: false,
      ),
      body: Center(child: Text("WORK IN PROGESS",style: TextStyle(fontSize:  MediaQuery.of(context).size.height/40),),),
    );
  }
}
