import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async{
   Database _database;

   WidgetsFlutterBinding.ensureInitialized();

   String path = join(await getDatabasesPath(), "GoodsDatabase.db");
  _database= await openDatabase(path,
  version: 1,
  );


  final allRows = await _database.query("goods");

  allRows.forEach((row) => print(row.toString()));
}
