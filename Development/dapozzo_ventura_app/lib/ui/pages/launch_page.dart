import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:dapozzo_ventura_app/data/providers/database_helper.dart';
import 'package:dapozzo_ventura_app/data/repositories/category_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(final BuildContext context) {
    print('LaunchState build start');
    final Widget w = Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
          strokeWidth: 5,
        ),
      ),
    );
    print('LaunchState build end');
    return w;
  }

  @override
  void initState() {
    print('LaunchState initState start');
    super.initState();
    _appInitialization();
    print('LaunchState initState end');
  }

  void _appInitialization() async {
    print('LaunchState _appInitialization begin');
    // simulate some time consuming initialization task
    final dbHelper = DatabaseHelper.instance;
    List<CategoryModel> allCategories =
        await CategoryRepository.getAllCategories();
    List<Sport> allSports = await dbHelper.querySports();
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, "/home",
        arguments: Arguments(allSports, allCategories));
    print('LaunchState _appInitialization end');
  }
}

class Arguments {
  final List<CategoryModel> allCategories;
  final List<Sport> allSports;

  Arguments(this.allSports, this.allCategories);
}
