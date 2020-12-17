import 'package:flutter/cupertino.dart';

class Sport {

  final IconData icon;
  final String name;

  Sport(this.icon, this.name);
  @override
  String toString() {
    // TODO: implement toString
    return name;
  }


}