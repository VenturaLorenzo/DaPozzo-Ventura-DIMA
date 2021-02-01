import 'package:dapozzo_ventura_app/ui/eQuip_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName;

  const ProfilePage({Key key, this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: EquipAppBar(withMenu: false,title: userName,),);
  }
}
