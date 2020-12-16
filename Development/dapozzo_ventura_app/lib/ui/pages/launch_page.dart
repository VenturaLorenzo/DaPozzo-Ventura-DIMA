import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(final BuildContext context) {
    print('LaunchState build start');
    final Widget w = Scaffold(body: Center(child: CircularProgressIndicator(),),);
    print('LaunchState build end');
    return w;
  }

  @override
  void initState() {
    print('LaunchState initState start');
    super.initState();
    print('LaunchState initState middle');
    _appInitialization();
    print('LaunchState initState end');
  }

  void _appInitialization() async {
    print('LaunchState _appInitialization begin');
    // simulate some time consuming initialization task
    final dbHelper = DatabaseHelper.instance;
    List<CategoryModel> allCategories= await dbHelper.queryCategories();
    await Future.delayed(Duration(seconds: 3));

    print('LaunchState _appInitialization middle');
    Navigator.pushReplacementNamed(context,"/home",arguments: allCategories);
    print('LaunchState _appInitialization end');
  }
}
