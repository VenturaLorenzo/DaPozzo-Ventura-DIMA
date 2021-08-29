import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../global.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EquipAppBar(
        title: "Impostazioni",
        withMenu: false,
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Image.network(
              Globals.baseUrlImages + 'WorkInProgress.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
