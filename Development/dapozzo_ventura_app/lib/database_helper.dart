import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/product_model.dart';
import 'models/vendor_model.dart';


class DatabaseHelper {
  static final _databaseName = "GoodsDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'good';

  static final columnGoodId = '_good_id';
  static final columnTypology = 'typology';
  static final columnSize = 'size';
  static final columnQuantity = 'quantity';
  static final columnColor = 'color';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    deleteDatabase("GoodsDatabase.db");

    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {


    print("creo tabella vendor");
    await db.execute(''' CREATE TABLE vendor (        
            name TEXT NOT NULL,
            description TEXT NOT NULL,
            PRIMARY KEY ( name)      
          )''');

    print("creo tabella good_typology");
    await db.execute('''
          CREATE TABLE good_typology (
            vendor TEXT NOT NULL,
            name TEXT NOT NULL,
            image TEXT NOT NULL,
            price INTEGER NOT NULL,
            PRIMARY KEY (vendor, name)
          )
          ''');

    print("creo tabella goods");
    await db.execute('''
          CREATE TABLE $table (
            $columnTypology TEXT NOT NULL,
            $columnSize TEXT NOT NULL,
            $columnColor TEXT NOT NULL,
            $columnQuantity INTEGER NOT NULL,
            image STRING NOT NULL,
            PRIMARY KEY ( $columnTypology,$columnColor,$columnSize)
          )
          ''');

    print("inserisco dati tabella vendor");
    Map<String, dynamic> vendor1 = {'name': 'vendor1', 'description': 'prova'};
    Map<String, dynamic> vendor2 = {'name': 'vendor2', 'description': 'prova'};
    Map<String, dynamic> vendor3 = {'name': 'vendor3', 'description': 'prova'};
    Map<String, dynamic> vendor4 = {'name': 'vendor4', 'description': 'prova'};
    Map<String, dynamic> vendor5 = {'name': 'vendor5', 'description': 'prova'};

    await db.insert('vendor', vendor1);
    await db.insert('vendor', vendor2);
    await db.insert('vendor', vendor3);
    await db.insert('vendor', vendor4);
    await db.insert('vendor', vendor5);

    print("inserisco dati tabella good_typology");
    Map<String, dynamic> good_typology1 = {'vendor': 'vendor1','name':'felpa', 'image': 'prova','price': 1};
    Map<String, dynamic> good_typology2 = {'vendor': 'vendor2', 'name':'felpa','image': 'prova1','price': 1};
    Map<String, dynamic> good_typology3 = {'vendor': 'vendor3', 'name':'felpa','image': 'prova2','price': 1};
    Map<String, dynamic> good_typology4 = {'vendor': 'vendor4','name':'felpa2', 'image': 'prova3','price': 1};
    Map<String, dynamic> good_typology5 = {'vendor': 'vendor5','name':'felpa', 'image': 'prova4','price': 1};


    await db.insert('good_typology', good_typology1);
    await db.insert('good_typology', good_typology2);
    await db.insert('good_typology', good_typology3);
    await db.insert('good_typology', good_typology4);
    await db.insert('good_typology', good_typology5);
  }
/*
  Future<int> insert(Good good) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnTypology: good.typology,
      DatabaseHelper.columnSize: good.size,
      DatabaseHelper.columnColor: good.color,
      DatabaseHelper.columnQuantity: good.quantity,
    };

    Database db = await instance.database;
    return await db.insert(table, row);
  }*/
/*
  Future<List<Product>> queryAllGoods() async {
    Database db = await instance.database;
    final allRows = await db.query(table);

    List<Product> goods = new List<Product>();
    allRows.forEach((row) => goods.add(Product(
        typology: row['typology'],
        size: row['size'],
        color: row['color'],
        quantity: row['quantity'])));
    return goods;
  }
*/
  Future<List<Vendor>> queryAllVendors() async {
    Database db = await instance.database;
    final allRows = await db.query('vendor');

    List<Vendor> vendors = new List<Vendor>();
    allRows.forEach((row) => vendors.add(Vendor(name: row['name'], desc: row['description'])));
    return vendors;
  }
  Future<List<Product>> queryAllProduct(String vendorName) async {
    Database db = await instance.database;
    List<Map> result = await db.rawQuery('''SELECT name,image,price FROM good_typology WHERE vendor= ?  ''',[vendorName]);

    List<Product> products = new List<Product>();
    result.forEach((row) => products.add(Product(name: row['name'],image: row['image'],price: row['price'])));
    return products;
  }

  Future<List<Product>> queryAllProductWith(String vendorName, String query) async {
    Database db = await instance.database;
    List<Map> result = await db.rawQuery('''SELECT * FROM good_typology WHERE vendor= $vendorName  AND name LIke '%$query%'  ''');

    List<Product> products = new List<Product>();
    result.forEach((row) => products.add(Product(name: row['name'],image: row['image'],price: row['price'])));
    return products;
  }
  Future<List<Vendor>> queryVendorsWith(String query) async {
    Database db = await instance.database;
    List<Map> result = await db.rawQuery('''SELECT * FROM vendor WHERE name LIKE '%$query%' ''');

    List<Vendor> vendors = new List<Vendor>();
    result.forEach((row) => vendors.add(Vendor(name: row['name'], desc: row['description'])));
    return vendors;
  }
  Future<List<String>> queryAllGoodTypology() async {
    Database db = await instance.database;
    final allRows = await db.query('good_typology');

    List<String> types = new List<String>();
    allRows.forEach((row) => types.add(row['vendor']));
    return types;
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnGoodId];
    return await db
        .update(table, row, where: '$columnGoodId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnGoodId = ?', whereArgs: [id]);
  }
}