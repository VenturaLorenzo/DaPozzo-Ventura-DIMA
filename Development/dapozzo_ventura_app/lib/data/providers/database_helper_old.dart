import 'package:dapozzo_ventura_app/data/models/category_model.dart';
import 'package:dapozzo_ventura_app/data/models/sport_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/good_typology_model.dart';
import '../models/vendor_model.dart';

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
            images TEXT NOT NULL,
            categories TEXT NOT NULL,
            rating REAL NOT NULL,
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
    print("creo tabella good");
    await db.execute('''
          CREATE TABLE good (
            good_typology TEXT NOT NULL,
            color TEXT NOT NULL,
            size TEXT NOT NULL,
            images TEXT NOT NULL,
            quantity INTEGER NOT NULL,
            PRIMARY KEY (good_typology, color,size)
          )
          ''');



    print("inserisco dati tabella vendor");
    Map<String, dynamic> vendor1 = {
      'name': 'vendor1',
      'description': 'prova',
      'images':
          'image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg',
      'categories':
          'felpa,cappello,scarpe,giacca,sciarpa,calze,pantaloni,guanti,intimo',
      'rating':
          '3.6'
    };
    Map<String, dynamic> vendor2 = {
      'name': 'vendor2',
      'description': 'prova',
      'images':
          'image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg',
      'categories':
          'felpa,cappello,giacca,sciarpa,calze,pantaloni,guanti,intimo',
      'rating':
      '2.2'
    };
    Map<String, dynamic> vendor3 = {
      'name': 'vendor3',
      'description': 'prova',
      'images':
          'image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg',
      'categories': 'cappello,scarpe,giacca,sciarpa,pantaloni,guanti,intimo',
      'rating':
      '4.8'
    };
    Map<String, dynamic> vendor4 = {
      'name': 'vendor4',
      'description': 'prova',
      'images':
          'image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg',
      'categories': 'cappello,scarpe,giacca,sciarpa,calze,intimo',
      'rating':
      '1.2'
    };
    Map<String, dynamic> vendor5 = {
      'name': 'vendor5',
      'description': 'prova',
      'images':
          'image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg,image2.jpg',
      'categories': 'felpa,scarpe,giacca,sciarpa,calze,pantaloni,intimo',
      'rating':
      '3.2'
    };

    await db.insert('vendor', vendor1);
    await db.insert('vendor', vendor2);
    await db.insert('vendor', vendor3);
    await db.insert('vendor', vendor4);
    await db.insert('vendor', vendor5);

    print("inserisco dati tabella good_typology");
    Map<String, dynamic> good_typology1 = {
      'vendor': 'vendor1',
      'name': 'felpa5',
      'image': 'image2.jpg,image2.jpg,image2.jpg',
      'price': 1
    };
    Map<String, dynamic> good_typology14 = {
      'vendor': 'vendor1',
      'name': 'felpa4',
      'image': 'image2.jpg,image2.jpg,image2.jpg',
      'price': 1
    };
    Map<String, dynamic> good_typology11 = {
      'vendor': 'vendor1',
      'name': 'felpa3',
      'image': 'image2.jpg,image2.jpg,image2.jpg',
      'price': 1
    };
    Map<String, dynamic> good_typology12 = {
      'vendor': 'vendor1',
      'name': 'felpa2',
      'image': 'image2.jpg,image2.jpg,image2.jpg',
      'price': 1
    };
    Map<String, dynamic> good_typology13 = {
      'vendor': 'vendor1',
      'name': 'felpa1',
      'image': 'image2.jpg,image2.jpg,image2.jpg',
      'price': 1
    };
    Map<String, dynamic> good_typology2 = {
      'vendor': 'vendor2',
      'name': 'felpa',
      'image': 'image2.jpg,image2.jpg,image2.jpg',
      'price': 1
    };
    Map<String, dynamic> good_typology3 = {
      'vendor': 'vendor3',
      'name': 'felpa',
      'image': 'image2.jpg,image2.jpg,image2.jpg',
      'price': 1
    };
    Map<String, dynamic> good_typology4 = {
      'vendor': 'vendor4',
      'name': 'felpa2',
    'image': 'image2.jpg,image2.jpg,image2.jpg',

      'price': 1
    };
    Map<String, dynamic> good_typology5 = {
      'vendor': 'vendor5',
      'name': 'felpa',
      'image': 'image2.jpg,image2.jpg,image2.jpg',
      'price': 1
    };

    await db.insert('good_typology', good_typology1);
    await db.insert('good_typology', good_typology12);
    await db.insert('good_typology', good_typology11);
    await db.insert('good_typology', good_typology13);

    await db.insert('good_typology', good_typology14);

    await db.insert('good_typology', good_typology2);
    await db.insert('good_typology', good_typology3);
    await db.insert('good_typology', good_typology4);
    await db.insert('good_typology', good_typology5);
  }

  Future<List<GoodTypologyModel>> queryAllGoodTypologies(String vendorName) async {
    Database db = await instance.database;
    List<Map> result = await db.rawQuery(
        '''SELECT name,image,price FROM good_typology WHERE vendor= ?  ''',
        [vendorName]);
    List<GoodTypologyModel> goodTypologies = rowToGoodTypologys(result);

    return goodTypologies;
  }

  Future<List<GoodTypologyModel>> queryAllGoodTypeWith(
      String vendorName, String query) async {
    Database db = await instance.database;
    List<Map> result = await db.rawQuery(
        '''SELECT * FROM good_typology WHERE vendor= $vendorName  AND name LIke '%$query%'  ''');

    List<GoodTypologyModel> goodTypologies = new List<GoodTypologyModel>();
    result.forEach((row) => goodTypologies.add(
        GoodTypologyModel(name: row['name'], images: row['image'], price: row['price'])));
    return goodTypologies;
  }

  Future<List<Vendor>> queryVendors(
      String name, List<String> categories) async {
    Database db = await instance.database;

    List<Map> result = await db
        .rawQuery('''SELECT * FROM vendor WHERE  name LIKE '%$name%'  ''');
    print("entrato in query vendors");
    List<Vendor> vendors = rowsToVendors(result);
    return filterByCategoryOR(vendors, categories);
  }

  Future<List<CategoryModel>> queryCategories() async {
    final List<CategoryModel> categories = [
      CategoryModel(Icons.sentiment_very_dissatisfied, "felpa"),
      CategoryModel(Icons.search, "guanti"),
      CategoryModel(Icons.arrow_drop_down_circle, "scarpe"),
      CategoryModel(Icons.gesture, "pantaloni"),
      CategoryModel(Icons.polymer, "giacca"),
      CategoryModel(Icons.sentiment_very_dissatisfied, "calze"),
      CategoryModel(Icons.search, "intimo"),
      CategoryModel(Icons.arrow_drop_down_circle, "sciarpa"),
      CategoryModel(Icons.gesture, "cappello"),
    ];
    return categories;
  }
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
/*
  Future<List<String>> queryAllGoodType() async {
    Database db = await instance.database;
    final allRows = await db.query('good_typology');

    List<String> types = new List<String>();
    allRows.forEach((row) => types.add(row['vendor']));
    return types;
  }
*/
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




  List<Vendor> rowsToVendors(List<Map> allRows) {
    List<Vendor> vendors = new List<Vendor>();
    allRows.forEach((row) {
      String imagesList = row['images'];
      List<String> images = imagesList.split(',');
      String categoriesList = row['categories'];
      List<String> categories = categoriesList.split(',');
      List<CategoryModel> categoryModels=categories.map((stringa) => CategoryModel(Icons.ac_unit, stringa) ).toList();
      return vendors.add(Vendor(
          name: row['name'],
          desc: row['description'],
          images: images,
          categories: categoryModels,
      rating: row['rating']),
      );
    });
    return vendors;
  }
  List<Vendor> filterByCategoryOR(List<Vendor> vendors, List<String> categories) {
    if (categories.isEmpty) {
      return vendors;
    } else {
      List<Vendor> result = new List<Vendor>();
      vendors.forEach((vendor) {
       bool has=false;
        categories.forEach((cat) {
          vendor.categories.forEach((catModel) {if(catModel.name==cat) {has=true;}
          });

         if(has==true && !result.contains(vendor)){
           result.add(vendor);
         }
       });

      });

      return result;
    }
  }
  List<Vendor> filterByCategoryAND(List<Vendor> vendors, List<String> categories) {
    if (categories.isEmpty) {
      return vendors;
    } else {
      List<Vendor> result = new List<Vendor>();
      vendors.forEach((vendor) {
        if (vendor.categories.contains(categories[0])) {
          result.add(vendor);
        }
      });

      return filterByCategoryAND(result, categories.sublist(1));
    }
  }

  List<GoodTypologyModel> rowToGoodTypologys(List<Map> allRows) {


    List<GoodTypologyModel> goodtypology = new List<GoodTypologyModel>();
    allRows.forEach((row) {
      String imagesList = row['image'];
      List<String> images = imagesList.split(',');
      String name = row['name'];
      int price = row['price'];
      return goodtypology.add(GoodTypologyModel(
          name: name,

          images: images,
         price: price),
      );
    });
    return goodtypology;
  }
}
