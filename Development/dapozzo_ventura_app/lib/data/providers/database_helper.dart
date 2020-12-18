import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "GoodsDatabase.db";
  static final _databaseVersion = 1;

  static final tableGood = 'good';
  static final tableCategory = "GoodsCategories";
  static final tableVendorCategory = "VendorCategory";
  static final tableVendor = "Vendor";
  static final tableTypology = "good_typology";

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnGoodId = '_good_id';
  static final columnTypology = 'typology';
  static final columnSize = 'size';
  static final columnQuantity = 'quantity';
  static final columnColor = 'color';
  static final columnVendorId = 'vendorId';
  static final columnCategoryId = 'categoryId';
  static final columnDescription = 'description';
  static final columnImage = 'image';
  static final columnRating = 'rating';
  static final columnIcon = 'icon';
  static final columnGender = 'gender';
  static final columnPrice = 'price';

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

  /*++++++++++++++++++++++++++++++++++    CREAZIONE TABELLE    +++++++++++++++++++++++++++++++++++++++++*/

  // SQL code to create the database table VENDOR
  Future _onCreate(Database db, int version) async {
    print("crezione tabella $tableVendor");
    await db.execute(''' CREATE TABLE $tableVendor (        
            $columnId INTEGER NOT NULL,
            $columnName TEXT NOT NULL,
            $columnDescription TEXT NOT NULL,
            $columnImage TEXT NOT NULL,
            $columnRating REAL NOT NULL,
            PRIMARY KEY ($columnId)      
          )''');
    print("crezione tabella $tableVendor TERMINATA");

    // SQL code to create the database table CATEGORY
    print("Creazione tabella " + tableCategory);
    await db.execute(''' CREATE TABLE $tableCategory (  
            $columnId INTEGER NOT NULL,   
            $columnName TEXT NOT NULL,
            $columnIcon TEXT NOT NULL,
            PRIMARY KEY (id)      
          )''');
    print("Creazione tabella GoodsCategories TERMINATA");

    // SQL code to create the database table GOODSTYPOLOGIES
    print("Creazione tabella $tableTypology");
    await db.execute(''' CREATE TABLE $tableTypology (   
            id INTEGER NOT NULL,  
            $columnVendorId INTEGER NOT NULL,
            $columnCategoryId INT NOT NULL,
            $columnGender INT NOT NULL,
            $columnImage TEXT NOT NULL,
            $columnName TEXT NOT NULL,
            $columnDescription TEXT NOT NULL,
            $columnPrice INTEGER NOT NULL,
            PRIMARY KEY (id)      
          )''');
    print("Creazione tabella $tableTypology TERMINATA");

    // SQL code to create the database table VENDORCATEGORY
    print("Creazione tabella VendorCategory");
    await db.execute(''' CREATE TABLE $tableVendorCategory (  
            $columnVendorId INTEGER NOT NULL,   
            $columnCategoryId INTEGER NOT NULL,
            PRIMARY KEY ($columnVendorId,$columnCategoryId)      
          )''');
    print("Creazione tabella VendorCategory TERMINATA");

    // SQL code to create the database table GOODS
    print("Creazione tabella good");
    await db.execute('''
          CREATE TABLE good (
            $columnTypology TEXT NOT NULL,
            $columnColor TEXT NOT NULL,
            $columnSize TEXT NOT NULL,
            $columnQuantity INTEGER NOT NULL,
            PRIMARY KEY ($columnTypology ,$columnColor,$columnSize)
          )
          ''');
    print("Creazione tabella good TERMINATA");

    /*++++++++++++++++++++++++++++++++++    INSERIMENTO DATI IN TABELLE    +++++++++++++++++++++++++++++++++++++++++*/

    /*TABELLA VENDOR*/

    print("inserisco dati tabella vendor");
    Map<String, dynamic> vendor1 = {
      columnId: 1,
      columnName: 'LAccademia',
      columnDescription: 'prova',
      columnImage: 'SfondoFunzionale001.jpg',
      columnRating: '5'
    };
    Map<String, dynamic> vendor2 = {
      columnId: 2,
      columnName: 'Kano',
      columnDescription: 'ciao',
      columnImage: 'SfondoNicola002.jpg',
      columnRating: '4.2'
    };

    await db.insert(tableVendor, vendor1);
    await db.insert(tableVendor, vendor2);
    print("inserimento dati tabella vendor TERMINATO");

    /*TABELLA GOOD_TYPOLOGY*/

    print("Inserimento dati tabella good_typology");
    Map<String, dynamic> goodsTypology1 = {
      columnId: 1,
      columnVendorId: 1,
      columnCategoryId: 1,
      columnGender: 0,
      columnImage: 'Maglietta.jpg',
      columnName: 'Easy',
      columnDescription: 'Questa è una maglietta semplice',
      columnPrice: '15'
    };
    Map<String, dynamic> goodsTypology2 = {
      columnId: 2,
      columnVendorId: 1,
      columnCategoryId: 1,
      columnGender: 0,
      columnImage: 'RashUomo.jpg',
      columnName: 'Stylish',
      columnDescription: 'Questa è una maglietta stylish',
      columnPrice: '15'
    };
    Map<String, dynamic> goodsTypology3 = {
      columnId: 3,
      columnVendorId: 1,
      columnCategoryId: 2,
      columnGender: 1,
      columnImage: 'Spiro.jpg',
      columnName: 'AllBlack',
      columnDescription: 'Elasticizzato',
      columnPrice: '25'
    };
    Map<String, dynamic> goodsTypology4 = {
      columnId: 4,
      columnVendorId: 1,
      columnCategoryId: 2,
      columnGender: 1,
      columnImage: 'Shorts1.jpg',
      columnName: 'Traditional',
      columnDescription: 'disponibile in più colori',
      columnPrice: '25'
    };
    Map<String, dynamic> goodsTypology5 = {
      columnId: 5,
      columnVendorId: 1,
      columnCategoryId: 3,
      columnGender: 0,
      columnImage: 'KimonoUomoBianco1.jpg',
      columnName: 'FruitNinja',
      columnDescription: '2.1 kg',
      columnPrice: '110'
    };
    Map<String, dynamic> goodsTypology6 = {
      columnId: 6,
      columnVendorId: 1,
      columnCategoryId: 3,
      columnGender: 0,
      columnImage: 'KimonoUomoBlack1.jpg',
      columnName: 'NinjaStorm',
      columnDescription: '1.8 kg',
      columnPrice: '100'
    };
    Map<String, dynamic> goodsTypology7 = {
      columnId: 7,
      columnVendorId: 1,
      columnCategoryId: 3,
      columnGender: 1,
      columnImage: 'KimonoDonna.jpg',
      columnName: 'FightingLady',
      columnDescription: '1.5 kg , disponibile anche Rosa',
      columnPrice: '100'
    };

    await db.insert(tableTypology, goodsTypology1);
    await db.insert(tableTypology, goodsTypology2);
    await db.insert(tableTypology, goodsTypology3);
    await db.insert(tableTypology, goodsTypology4);
    await db.insert(tableTypology, goodsTypology5);
    await db.insert(tableTypology, goodsTypology6);
    await db.insert(tableTypology, goodsTypology7);
    print("Fine inserimento dati tabella $tableTypology");

    /*TABELLA CATEGORY*/

    print("Inserimento dati tabella $tableCategory");
    Map<String, dynamic> goodsCategory1 = {
      columnId: 1,
      columnName: 'Maglietta',
      columnIcon: 'ac_unit'
    };
    Map<String, dynamic> goodsCategory2 = {
      columnId: 2,
      columnName: 'Pantaloncino',
      columnIcon: 'cake'
    };
    Map<String, dynamic> goodsCategory3 = {
      columnId: 3,
      columnName: 'Kimono',
      columnIcon: 'backspace'
    };
    Map<String, dynamic> goodsCategory4 = {
      columnId: 4,
      columnName: 'Cintura',
      columnIcon: 'dashboard'
    };
    Map<String, dynamic> goodsCategory5 = {
      columnId: 5,
      columnName: 'Felpa',
      columnIcon: 'face'
    };
    Map<String, dynamic> goodsCategory6 = {
      columnId: 6,
      columnName: 'Tuta',
      columnIcon: 'favorite'
    };

    await db.insert(tableCategory, goodsCategory1);
    await db.insert(tableCategory, goodsCategory2);
    await db.insert(tableCategory, goodsCategory3);
    await db.insert(tableCategory, goodsCategory4);
    await db.insert(tableCategory, goodsCategory5);
    await db.insert(tableCategory, goodsCategory6);
    print("Fine inserimento dati tabella $tableCategory");

    /*TABELLA VENDOR CATEGORY*/
    print("Inserimento dati tabella $tableVendorCategory");
    Map<String, dynamic> vendorCategory1 = {
      columnVendorId: 1,
      columnCategoryId: 1,
    };
    Map<String, dynamic> vendorCategory2 = {
      columnVendorId: 1,
      columnCategoryId: 2,
    };
    Map<String, dynamic> vendorCategory3 = {
      columnVendorId: 1,
      columnCategoryId: 3,
    };
    Map<String, dynamic> vendorCategory4 = {
      columnVendorId: 2,
      columnCategoryId: 5,
    };
    Map<String, dynamic> vendorCategory5 = {
      columnVendorId: 2,
      columnCategoryId: 6,
    };
    Map<String, dynamic> vendorCategory6 = {
      columnVendorId: 2,
      columnCategoryId: 1,
    };

    await db.insert(tableVendorCategory, vendorCategory1);
    await db.insert(tableVendorCategory, vendorCategory2);
    await db.insert(tableVendorCategory, vendorCategory3);
    await db.insert(tableVendorCategory, vendorCategory4);
    await db.insert(tableVendorCategory, vendorCategory5);
    await db.insert(tableVendorCategory, vendorCategory6);
    print("Fine Inserimento dati tabella $tableVendorCategory");
  }

  /*++++++++++++++++++++++++++++++++++    QUERY    +++++++++++++++++++++++++++++++++++++++++*/

  Future<List<Map>> getVendors(String name, List<int> categories) async {
    Database db = await instance.database;

    var query = "SELECT * FROM $tableVendor WHERE name LIKE '%$name%'";
    List<Map> result;

    if (categories.length > 0) {
      query =
          "SELECT DISTINCT $tableVendor.* FROM  $tableVendor, $tableVendorCategory WHERE $tableVendor.$columnName LIKE '%$name%' AND (";
      categories.forEach((element) {
        query += "$tableVendorCategory.$columnCategoryId = $element OR";
      });
      query = query.substring(0, query.length - 3);
      query += ")";

      result = await db.rawQuery(query);
    } else {
      var query = "SELECT * FROM $tableVendor WHERE name LIKE '%$name%'";
      result = await db.rawQuery(query);
    }

    return result;
  }

  Future<List<Map>> getCategories(int vendorId) async {
    Database db = await instance.database;

    List<Map> result = await db.rawQuery(
        '''SELECT $tableCategory.* FROM $tableCategory INNER JOIN $tableVendorCategory ON $tableCategory.id = $tableVendorCategory.$columnCategoryId WHERE $tableVendorCategory.$columnVendorId = ?''',
        [vendorId]);
    return result;
  }

  Future<List<Map>> getAllCategories() async {
    Database db = await instance.database;

    // get single row
    List<String> columnsToSelect = [columnId, columnName, columnIcon];

    List<Map> result = await db.query(tableCategory, columns: columnsToSelect);

    return result;
  }

  Future<List<Map>> getGoodsTypologies(
      List<int> categoryIds, int genderFilter) async {
    Database db = await instance.database;

    var query =
        "SELECT $tableTypology.$columnId, $tableTypology.$columnCategoryId, $tableTypology.$columnGender,";
    query +=
        "$tableTypology.$columnImage, $tableTypology.$columnName, $tableTypology.$columnDescription, $tableTypology.$columnPrice,";
    query += "$tableCategory.$columnName AS categoryName ";
    query +=
        "FROM $tableTypology INNER JOIN $tableCategory ON $tableTypology.$columnCategoryId = $tableCategory.$columnId";

    List<Map> result;

    var whereString = "";

    if (genderFilter > -1) {
      whereString += "($columnGender = ${genderFilter.toString()})";
    }

    if (categoryIds.length > 0) {
      if (whereString.isNotEmpty) {
        whereString += " and ";
      }

      whereString += " (";
      for (var i = 0; i < categoryIds.length; i++) {
        whereString += "($columnCategoryId = ${categoryIds[i].toString()}) OR ";
      }
      whereString = whereString.substring(0, whereString.length - 3);
      whereString += ")";

      query += " WHERE " + whereString;
    }

    result = await db.rawQuery(query);

    return result;
  }

  Future<List<Map>> getGoodsTypologiesByVendor(
      List<int> categoryIds, int genderFilter, int vendorId) async {
    Database db = await instance.database;

    var query =
        "SELECT $tableTypology.$columnId, $tableTypology.$columnCategoryId, $tableTypology.$columnGender,$tableTypology.$columnVendorId,";
    query +=
        "$tableTypology.$columnImage, $tableTypology.$columnName, $tableTypology.$columnDescription, $tableTypology.$columnPrice,";
    query += "$tableCategory.$columnName AS categoryName ";
    query +=
        "FROM $tableTypology INNER JOIN $tableCategory ON $tableTypology.$columnCategoryId = $tableCategory.$columnId";

    List<Map> result;

    var whereString = "";

    if (genderFilter > -1) {
      whereString += "($columnGender = ${genderFilter.toString()})";
    }

    if (categoryIds.length > 0) {
      if (whereString.isNotEmpty) {
        whereString += " and ";
      }

      whereString += " (";
      for (var i = 0; i < categoryIds.length; i++) {
        whereString += "($columnCategoryId = ${categoryIds[i].toString()}) OR ";
      }
      whereString = whereString.substring(0, whereString.length - 3);
      whereString += ")";

      query += " WHERE " + whereString;
    }

    result = await db.rawQuery(query);

    return result;
  }

  // da cancellare
  Future<List<Sport>> querySports() async {
    final List<Sport> sports = [
      Sport(Icons.sentiment_very_dissatisfied, "basket"),
      Sport(Icons.search, "calcio"),
      Sport(Icons.polymer, "golf"),
      Sport(Icons.gesture, "atletica"),
      Sport(Icons.arrow_drop_down_circle, "nuoto"),
      Sport(Icons.sentiment_very_dissatisfied, "pallavolo"),
    ];
    return sports;
  }
}
