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
  static final tableSport = "Sport";
  static final tableVendorSport = "VendorSport";
  static final tableColor = "Color";
  static final tableSize = "Size";
  static final tableGoodImage = "GoodImage";

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnGoodId = '_good_id';
  static final columnTypology = 'typology';
  static final columnSize = 'size';
  static final columnQuantity = 'quantity';
  static final columnColor = 'color';
  static final columnVendorId = 'vendorId';
  static final columnCategoryId = 'categoryId';
  static final columnSportId = 'sportId';
  static final columnDescription = 'description';
  static final columnImage = 'image';
  static final columnRating = 'rating';
  static final columnIcon = 'icon';
  static final columnGender = 'gender';
  static final columnPrice = 'price';
  static final columnCode = 'code';
  static final columnColorId = 'colorId';
  static final columnSizeId = 'sizeId';
  static final columnTypologyId = 'typologyId';

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
            PRIMARY KEY ($columnId)      
          )''');
    print("Creazione tabella GoodsCategories TERMINATA");

// SQL code to create the database table SPORT
    print("Creazione tabella " + tableSport);
    await db.execute(''' CREATE TABLE $tableSport (  
            $columnId INTEGER NOT NULL,   
            $columnName TEXT NOT NULL,
            $columnIcon TEXT NOT NULL,
            PRIMARY KEY ($columnId)      
          )''');
    print("Creazione tabella $tableSport TERMINATA");

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
            PRIMARY KEY ($columnId)      
          )''');
    print("Creazione tabella $tableTypology TERMINATA");

    // SQL code to create the database table VENDORCATEGORY
    print("Creazione tabella $tableVendorCategory");
    await db.execute(''' CREATE TABLE $tableVendorCategory (  
            $columnVendorId INTEGER NOT NULL,   
            $columnCategoryId INTEGER NOT NULL,
            PRIMARY KEY ($columnVendorId,$columnCategoryId)      
          )''');
    print("Creazione tabella $tableVendorCategory TERMINATA");

    // SQL code to create the database table VENDORSPORT
    print("Creazione tabella $tableVendorSport");
    await db.execute(''' CREATE TABLE $tableVendorSport (  
            $columnVendorId INTEGER NOT NULL,   
            $columnSportId INTEGER NOT NULL,
            PRIMARY KEY ($columnVendorId,$columnSportId)      
          )''');
    print("Creazione tabella $tableVendorSport TERMINATA");

    // SQL code to create the database table GOODS
    print("Creazione tabella $tableGood");
    await db.execute('''
          CREATE TABLE $tableGood (
            $columnId INTEGER NOT NULL,
            $columnTypologyId INTEGER NOT NULL,
            $columnColorId INTEGER NOT NULL,
            $columnSizeId INTEGER NOT NULL,
            $columnQuantity INTEGER NOT NULL,
            PRIMARY KEY ($columnId)
          )''');
    print("Creazione tabella $tableGood TERMINATA");

    // SQL code to create the database table COLOR
    print("Creazione tabella $tableColor");
    await db.execute(''' CREATE TABLE $tableColor (   
            $columnId INTEGER NOT NULL,              
            $columnName TEXT NOT NULL,
            $columnCode TEXT NOT NULL,
            PRIMARY KEY ($columnId)      
          )''');
    print("Creazione tabella $tableColor TERMINATA");

    // SQL code to create the database table SIZE
    print("Creazione tabella $tableSize");
    await db.execute(''' CREATE TABLE $tableSize (   
            $columnId INTEGER NOT NULL,              
            $columnName TEXT NOT NULL,
            PRIMARY KEY ($columnId)      
          )''');
    print("Creazione tabella $tableSize TERMINATA");

    // SQL code to create the database table GOODIMAGE
    print("Creazione tabella $tableGoodImage");
    await db.execute(''' CREATE TABLE $tableGoodImage (   
            $columnId INTEGER NOT NULL,
            $columnTypologyId INTEGER NOT NULL,              
            $columnColorId INTEGER NOT NULL,
            $columnImage TEXT NOT NULL,
            PRIMARY KEY ($columnId)      
          )''');
    print("Creazione tabella $tableGoodImage TERMINATA");

    /*++++++++++++++++++++++++++++++++++    INSERIMENTO DATI IN TABELLE    +++++++++++++++++++++++++++++++++++++++++*/

    /*TABELLA VENDOR*/
    print("inserisco dati tabella $tableVendor");
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
    Map<String, dynamic> vendor3 = {
      columnId: 3,
      columnName: 'Patagonia',
      columnDescription: 'Be Natural',
      columnImage: 'SfondoMauro003.jpg',
      columnRating: '4.8'
    };

    await db.insert(tableVendor, vendor1);
    await db.insert(tableVendor, vendor2);
    await db.insert(tableVendor, vendor3);
    print("inserimento dati tabella $tableVendor TERMINATO");

    /*TABELLA GOOD_TYPOLOGY*/
    print("Inserimento dati tabella $tableTypology");
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
      columnVendorId: 2,
      columnCategoryId: 3,
      columnGender: 0,
      columnImage: 'KimonoUomoBianco1.jpg',
      columnName: 'FruitNinja',
      columnDescription: '2.1 kg',
      columnPrice: '110'
    };
    Map<String, dynamic> goodsTypology6 = {
      columnId: 6,
      columnVendorId: 2,
      columnCategoryId: 3,
      columnGender: 0,
      columnImage: 'KimonoUomoBlack1.jpg',
      columnName: 'NinjaStorm',
      columnDescription: '1.8 kg',
      columnPrice: '100'
    };
    Map<String, dynamic> goodsTypology7 = {
      columnId: 7,
      columnVendorId: 2,
      columnCategoryId: 3,
      columnGender: 1,
      columnImage: 'KimonoDonna.jpg',
      columnName: 'FightingLady',
      columnDescription: '1.5 kg , disponibile anche Rosa',
      columnPrice: '100'
    };
    Map<String, dynamic> goodsTypology8 = {
      columnId: 8,
      columnVendorId: 3,
      columnCategoryId: 7,
      columnGender: 0,
      columnImage:
          'https://www.patagonia.com/dw/image/v2/BDJB_PRD/on/demandware.static/-/Sites-patagonia-master/default/dw3b35cee4/images/hi-res/34540_FGE.jpg?sw=500&sh=500&sfrm=png&q=95&bgcolor=f6f6f6',
      columnName: 'Capinele Midweight Liner Gloves',
      columnDescription: 'con tessuto riciclato',
      columnPrice: '45'
    };
    Map<String, dynamic> goodsTypology9 = {
      columnId: 9,
      columnVendorId: 1,
      columnCategoryId: 5,
      columnGender: 0,
      columnImage: 'FelpaCompetition.jpg',
      columnName: 'Competition Team',
      columnDescription: 'Produzione Italiana',
      columnPrice: '40'
    };
    Map<String, dynamic> goodsTypology10 = {
      columnId: 10,
      columnVendorId: 2,
      columnCategoryId: 5,
      columnGender: 0,
      columnImage: 'FelpaLeggeraBurgundy4.jpg',
      columnName: 'Ricciolo',
      columnDescription: 'Anche sul polso',
      columnPrice: '30'
    };
    Map<String, dynamic> goodsTypology11 = {
      columnId: 11,
      columnVendorId: 2,
      columnCategoryId: 5,
      columnGender: 1,
      columnImage: 'FelpaLeggeraGrigio3.jpg',
      columnName: 'Ricciolo',
      columnDescription: 'Anche sul polso',
      columnPrice: '30'
    };

    await db.insert(tableTypology, goodsTypology1);
    await db.insert(tableTypology, goodsTypology2);
    await db.insert(tableTypology, goodsTypology3);
    await db.insert(tableTypology, goodsTypology4);
    await db.insert(tableTypology, goodsTypology5);
    await db.insert(tableTypology, goodsTypology6);
    await db.insert(tableTypology, goodsTypology7);
    await db.insert(tableTypology, goodsTypology8);
    await db.insert(tableTypology, goodsTypology9);
    await db.insert(tableTypology, goodsTypology10);
    await db.insert(tableTypology, goodsTypology11);

    print("Fine inserimento dati tabella $tableTypology");

    /*TABELLA CATEGORY*/
    print("Inserimento dati tabella $tableCategory");
    Map<String, dynamic> goodsCategory1 = {
      columnId: 1,
      columnName: 'Maglietta',
      columnIcon: 'ac_unit.png'
    };
    Map<String, dynamic> goodsCategory2 = {
      columnId: 2,
      columnName: 'Pantaloncino',
      columnIcon: 'pantaloncino.png'
    };
    Map<String, dynamic> goodsCategory3 = {
      columnId: 3,
      columnName: 'Kimono',
      columnIcon: 'kimono.png'
    };
    Map<String, dynamic> goodsCategory4 = {
      columnId: 4,
      columnName: 'Cintura',
      columnIcon: 'cintura.png'
    };
    Map<String, dynamic> goodsCategory5 = {
      columnId: 5,
      columnName: 'Felpa',
      columnIcon: 'felpa.png'
    };
    Map<String, dynamic> goodsCategory6 = {
      columnId: 6,
      columnName: 'Tuta',
      columnIcon: 'tuta.png'
    };
    Map<String, dynamic> goodsCategory7 = {
      columnId: 7,
      columnName: 'Gloves',
      columnIcon: 'gloves.png'
    };

    await db.insert(tableCategory, goodsCategory1);
    await db.insert(tableCategory, goodsCategory2);
    await db.insert(tableCategory, goodsCategory3);
    await db.insert(tableCategory, goodsCategory4);
    await db.insert(tableCategory, goodsCategory5);
    await db.insert(tableCategory, goodsCategory6);
    await db.insert(tableCategory, goodsCategory7);
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
      columnCategoryId: 3,
    };
    Map<String, dynamic> vendorCategory5 = {
      columnVendorId: 2,
      columnCategoryId: 5,
    };
    // Map<String, dynamic> vendorCategory6 = {
    //   columnVendorId: 2,
    //   columnCategoryId: 1,
    // };
    Map<String, dynamic> vendorCategory7 = {
      columnVendorId: 3,
      columnCategoryId: 7,
    };
    Map<String, dynamic> vendorCategory8 = {
      columnVendorId: 1,
      columnCategoryId: 5,
    };

    await db.insert(tableVendorCategory, vendorCategory1);
    await db.insert(tableVendorCategory, vendorCategory2);
    await db.insert(tableVendorCategory, vendorCategory3);
    await db.insert(tableVendorCategory, vendorCategory4);
    await db.insert(tableVendorCategory, vendorCategory5);
    // await db.insert(tableVendorCategory, vendorCategory6);
    await db.insert(tableVendorCategory, vendorCategory7);
    await db.insert(tableVendorCategory, vendorCategory8);
    print("Fine Inserimento dati tabella $tableVendorCategory");

    /*TABELLA SPORT*/
    print("Inserimento dati tabella $tableSport");
    Map<String, dynamic> sport1 = {
      columnId: 1,
      columnName: 'Bjj',
      columnIcon: 'favorite'
    };
    Map<String, dynamic> sport2 = {
      columnId: 2,
      columnName: 'MMA',
      columnIcon: 'favorite'
    };
    Map<String, dynamic> sport3 = {
      columnId: 3,
      columnName: 'Arrampicata',
      columnIcon: 'favorite'
    };
    Map<String, dynamic> sport4 = {
      columnId: 4,
      columnName: 'Tennnis',
      columnIcon: 'favorite'
    };
    Map<String, dynamic> sport5 = {
      columnId: 5,
      columnName: 'Montagna',
      columnIcon: 'favorite'
    };
    Map<String, dynamic> sport6 = {
      columnId: 6,
      columnName: 'Funzionale',
      columnIcon: 'favorite'
    };

    await db.insert(tableSport, sport1);
    await db.insert(tableSport, sport2);
    await db.insert(tableSport, sport3);
    await db.insert(tableSport, sport4);
    await db.insert(tableSport, sport5);
    await db.insert(tableSport, sport6);
    print("Fine Inserimento dati tabella $tableSport");

    /*TABELLA VENDOR SPORT*/
    print("Inserimento dati tabella $tableVendorSport");
    Map<String, dynamic> vendorSport1 = {
      columnVendorId: 1,
      columnSportId: 1,
    };
    Map<String, dynamic> vendorSport2 = {
      columnVendorId: 2,
      columnSportId: 2,
    };
    Map<String, dynamic> vendorSport3 = {
      columnVendorId: 3,
      columnSportId: 5,
    };
    Map<String, dynamic> vendorSport4 = {
      columnVendorId: 1,
      columnSportId: 6,
    };
    Map<String, dynamic> vendorSport5 = {
      columnVendorId: 2,
      columnSportId: 1,
    };
    await db.insert(tableVendorSport, vendorSport1);
    await db.insert(tableVendorSport, vendorSport2);
    await db.insert(tableVendorSport, vendorSport3);
    await db.insert(tableVendorSport, vendorSport4);
    await db.insert(tableVendorSport, vendorSport5);
    print("Fine Inserimento dati tabella $tableVendorSport");

    /*TABELLA COLOR*/
    print("Inserimento dati tabella $tableColor");
    Map<String, dynamic> color1 = {
      columnId: 1,
      columnName: 'Black',
      columnCode: '000000',
    };
    Map<String, dynamic> color2 = {
      columnId: 2,
      columnName: 'White',
      columnCode: 'FFFFFF',
    };
    Map<String, dynamic> color3 = {
      columnId: 3,
      columnName: 'RoyalBlue',
      columnCode: '4169e1',
    };
    Map<String, dynamic> color4 = {
      columnId: 4,
      columnName: 'Burgundy',
      columnCode: '5e2e2d',
    };
    Map<String, dynamic> color5 = {
      columnId: 5,
      columnName: 'LightGrey',
      columnCode: 'c5c7c4',
    };
    await db.insert(tableColor, color1);
    await db.insert(tableColor, color2);
    await db.insert(tableColor, color3);
    await db.insert(tableColor, color4);
    await db.insert(tableColor, color5);
    print("Fine Inserimento dati tabella $tableColor");

    /*TABELLA SIZE*/
    print("Inserimento dati tabella $tableSize");
    Map<String, dynamic> size1 = {
      columnId: 1,
      columnName: 'S',
    };
    Map<String, dynamic> size2 = {
      columnId: 2,
      columnName: 'M',
    };
    Map<String, dynamic> size3 = {
      columnId: 3,
      columnName: 'L',
    };
    Map<String, dynamic> size4 = {
      columnId: 4,
      columnName: 'XL',
    };
    await db.insert(tableSize, size1);
    await db.insert(tableSize, size2);
    await db.insert(tableSize, size3);
    await db.insert(tableSize, size4);

    /*TABELLA GOODS*/
    print("Inserimento dati tabella $tableGood");
    Map<String, dynamic> good1 = {
      columnId: 1,
      columnTypologyId: 1,
      columnColorId: 3,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good2 = {
      columnId: 2,
      columnTypologyId: 1,
      columnColorId: 3,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good3 = {
      columnId: 3,
      columnTypologyId: 1,
      columnColorId: 3,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good4 = {
      columnId: 4,
      columnTypologyId: 1,
      columnColorId: 3,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good5 = {
      columnId: 5,
      columnTypologyId: 1,
      columnColorId: 4,
      columnSizeId: 1,
      columnQuantity: 0,
    };
    Map<String, dynamic> good6 = {
      columnId: 6,
      columnTypologyId: 1,
      columnColorId: 4,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good7 = {
      columnId: 7,
      columnTypologyId: 1,
      columnColorId: 4,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good8 = {
      columnId: 8,
      columnTypologyId: 1,
      columnColorId: 4,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good9 = {
      columnId: 9,
      columnTypologyId: 5,
      columnColorId: 3,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good10 = {
      columnId: 10,
      columnTypologyId: 5,
      columnColorId: 3,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good11 = {
      columnId: 11,
      columnTypologyId: 5,
      columnColorId: 3,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good12 = {
      columnId: 12,
      columnTypologyId: 5,
      columnColorId: 3,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good13 = {
      columnId: 13,
      columnTypologyId: 5,
      columnColorId: 1,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good14 = {
      columnId: 14,
      columnTypologyId: 5,
      columnColorId: 1,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good15 = {
      columnId: 15,
      columnTypologyId: 5,
      columnColorId: 1,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good16 = {
      columnId: 16,
      columnTypologyId: 5,
      columnColorId: 1,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good17 = {
      columnId: 17,
      columnTypologyId: 8,
      columnColorId: 3,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good18 = {
      columnId: 18,
      columnTypologyId: 8,
      columnColorId: 3,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good19 = {
      columnId: 19,
      columnTypologyId: 8,
      columnColorId: 3,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good20 = {
      columnId: 20,
      columnTypologyId: 8,
      columnColorId: 3,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good21 = {
      columnId: 21,
      columnTypologyId: 8,
      columnColorId: 1,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good22 = {
      columnId: 22,
      columnTypologyId: 8,
      columnColorId: 1,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good23 = {
      columnId: 23,
      columnTypologyId: 8,
      columnColorId: 1,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good24 = {
      columnId: 24,
      columnTypologyId: 8,
      columnColorId: 1,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good25 = {
      columnId: 25,
      columnTypologyId: 9,
      columnColorId: 3,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good26 = {
      columnId: 26,
      columnTypologyId: 9,
      columnColorId: 3,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good27 = {
      columnId: 27,
      columnTypologyId: 9,
      columnColorId: 3,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good28 = {
      columnId: 28,
      columnTypologyId: 9,
      columnColorId: 3,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good29 = {
      columnId: 29,
      columnTypologyId: 9,
      columnColorId: 1,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good30 = {
      columnId: 30,
      columnTypologyId: 9,
      columnColorId: 1,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good31 = {
      columnId: 31,
      columnTypologyId: 9,
      columnColorId: 1,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good32 = {
      columnId: 32,
      columnTypologyId: 9,
      columnColorId: 1,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good33 = {
      columnId: 33,
      columnTypologyId: 1,
      columnColorId: 1,
      columnSizeId: 1,
      columnQuantity: 0,
    };
    Map<String, dynamic> good34 = {
      columnId: 34,
      columnTypologyId: 1,
      columnColorId: 1,
      columnSizeId: 2,
      columnQuantity: 0,
    };
    Map<String, dynamic> good35 = {
      columnId: 35,
      columnTypologyId: 1,
      columnColorId: 1,
      columnSizeId: 3,
      columnQuantity: 0,
    };
    Map<String, dynamic> good36 = {
      columnId: 36,
      columnTypologyId: 1,
      columnColorId: 1,
      columnSizeId: 4,
      columnQuantity: 0,
    };
    Map<String, dynamic> good37 = {
      columnId: 37,
      columnTypologyId: 10,
      columnColorId: 4,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good38 = {
      columnId: 38,
      columnTypologyId: 10,
      columnColorId: 4,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good39 = {
      columnId: 39,
      columnTypologyId: 10,
      columnColorId: 4,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good40 = {
      columnId: 40,
      columnTypologyId: 10,
      columnColorId: 4,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good41 = {
      columnId: 41,
      columnTypologyId: 10,
      columnColorId: 5,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good42 = {
      columnId: 42,
      columnTypologyId: 10,
      columnColorId: 5,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good43 = {
      columnId: 43,
      columnTypologyId: 10,
      columnColorId: 5,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good44 = {
      columnId: 44,
      columnTypologyId: 10,
      columnColorId: 5,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good45 = {
      columnId: 45,
      columnTypologyId: 11,
      columnColorId: 4,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good46 = {
      columnId: 46,
      columnTypologyId: 11,
      columnColorId: 4,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good47 = {
      columnId: 47,
      columnTypologyId: 11,
      columnColorId: 4,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good48 = {
      columnId: 48,
      columnTypologyId: 11,
      columnColorId: 4,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good49 = {
      columnId: 49,
      columnTypologyId: 11,
      columnColorId: 5,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good50 = {
      columnId: 50,
      columnTypologyId: 11,
      columnColorId: 5,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good51 = {
      columnId: 51,
      columnTypologyId: 11,
      columnColorId: 5,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good52 = {
      columnId: 52,
      columnTypologyId: 11,
      columnColorId: 5,
      columnSizeId: 4,
      columnQuantity: 100,
    };

    await db.insert(tableGood, good1);
    await db.insert(tableGood, good2);
    await db.insert(tableGood, good3);
    await db.insert(tableGood, good4);
    await db.insert(tableGood, good5);
    await db.insert(tableGood, good6);
    await db.insert(tableGood, good7);
    await db.insert(tableGood, good8);
    await db.insert(tableGood, good9);
    await db.insert(tableGood, good10);
    await db.insert(tableGood, good11);
    await db.insert(tableGood, good12);
    await db.insert(tableGood, good13);
    await db.insert(tableGood, good14);
    await db.insert(tableGood, good15);
    await db.insert(tableGood, good16);
    await db.insert(tableGood, good17);
    await db.insert(tableGood, good18);
    await db.insert(tableGood, good19);
    await db.insert(tableGood, good20);
    await db.insert(tableGood, good21);
    await db.insert(tableGood, good22);
    await db.insert(tableGood, good23);
    await db.insert(tableGood, good24);
    await db.insert(tableGood, good25);
    await db.insert(tableGood, good26);
    await db.insert(tableGood, good27);
    await db.insert(tableGood, good28);
    await db.insert(tableGood, good29);
    await db.insert(tableGood, good30);
    await db.insert(tableGood, good31);
    await db.insert(tableGood, good32);
    await db.insert(tableGood, good33);
    await db.insert(tableGood, good34);
    await db.insert(tableGood, good35);
    await db.insert(tableGood, good36);
    await db.insert(tableGood, good37);
    await db.insert(tableGood, good38);
    await db.insert(tableGood, good39);
    await db.insert(tableGood, good40);
    await db.insert(tableGood, good41);
    await db.insert(tableGood, good42);
    await db.insert(tableGood, good43);
    await db.insert(tableGood, good44);
    await db.insert(tableGood, good45);
    await db.insert(tableGood, good46);
    await db.insert(tableGood, good47);
    await db.insert(tableGood, good48);
    await db.insert(tableGood, good49);
    await db.insert(tableGood, good50);
    await db.insert(tableGood, good51);
    await db.insert(tableGood, good52);
    print("Fine Inserimento dati tabella $tableGood");

    /*TABELLA GOODIMAGE*/
    print("Inserimento dati tabella $tableGoodImage");
    Map<String, dynamic> goodImage1 = {
      columnId: 1,
      columnTypologyId: 9,
      columnColorId: 3,
      columnImage: 'FelpaCompetitionRoyalBlue1.jpg',
    };
    Map<String, dynamic> goodImage2 = {
      columnId: 2,
      columnTypologyId: 9,
      columnColorId: 3,
      columnImage: 'FelpaCompetitionRoyalBlue2.jpg',
    };
    Map<String, dynamic> goodImage3 = {
      columnId: 3,
      columnTypologyId: 9,
      columnColorId: 3,
      columnImage: 'FelpaCompetitionRoyalBlue3.jpg',
    };
    Map<String, dynamic> goodImage4 = {
      columnId: 4,
      columnTypologyId: 9,
      columnColorId: 3,
      columnImage: 'FelpaCompetitionRoyalBlue4.jpg',
    };
    Map<String, dynamic> goodImage5 = {
      columnId: 5,
      columnTypologyId: 9,
      columnColorId: 3,
      columnImage: 'FelpaCompetitionRoyalBlue5.jpg',
    };
    Map<String, dynamic> goodImage6 = {
      columnId: 6,
      columnTypologyId: 9,
      columnColorId: 1,
      columnImage: 'FelpaWICBlack1.jpg',
    };
    Map<String, dynamic> goodImage7 = {
      columnId: 7,
      columnTypologyId: 9,
      columnColorId: 1,
      columnImage: 'FelpaWICBlack2.jpg',
    };
    Map<String, dynamic> goodImage8 = {
      columnId: 8,
      columnTypologyId: 9,
      columnColorId: 1,
      columnImage: 'FelpaWICBlack3.jpg',
    };
    Map<String, dynamic> goodImage9 = {
      columnId: 9,
      columnTypologyId: 9,
      columnColorId: 1,
      columnImage: 'FelpaWICBlack4.jpg',
    };
    Map<String, dynamic> goodImage10 = {
      columnId: 10,
      columnTypologyId: 1,
      columnColorId: 1,
      columnImage: 'MagliettaBlack1.jpg',
    };
    Map<String, dynamic> goodImage11 = {
      columnId: 11,
      columnTypologyId: 1,
      columnColorId: 1,
      columnImage: 'MagliettaBlack2.jpg',
    };
    Map<String, dynamic> goodImage12 = {
      columnId: 12,
      columnTypologyId: 1,
      columnColorId: 1,
      columnImage: 'MagliettaBlack3.jpg',
    };
    Map<String, dynamic> goodImage13 = {
      columnId: 13,
      columnTypologyId: 1,
      columnColorId: 1,
      columnImage: 'MagliettaBlack4.jpg',
    };
    Map<String, dynamic> goodImage14 = {
      columnId: 14,
      columnTypologyId: 1,
      columnColorId: 1,
      columnImage: 'MagliettaBlack5.jpg',
    };
    Map<String, dynamic> goodImage15 = {
      columnId: 15,
      columnTypologyId: 1,
      columnColorId: 3,
      columnImage: 'MagliettaRoyalBlue1.jpg',
    };
    Map<String, dynamic> goodImage16 = {
      columnId: 16,
      columnTypologyId: 1,
      columnColorId: 3,
      columnImage: 'MagliettaRoyalBlue2.jpg',
    };
    Map<String, dynamic> goodImage17 = {
      columnId: 17,
      columnTypologyId: 1,
      columnColorId: 3,
      columnImage: 'MagliettaRoyalBlue3.jpg',
    };
    Map<String, dynamic> goodImage18 = {
      columnId: 18,
      columnTypologyId: 1,
      columnColorId: 3,
      columnImage: 'MagliettaRoyalBlue4.jpg',
    };
    Map<String, dynamic> goodImage19 = {
      columnId: 19,
      columnTypologyId: 1,
      columnColorId: 3,
      columnImage: 'MagliettaRoyalBlue5.jpg',
    };
    Map<String, dynamic> goodImage20 = {
      columnId: 20,
      columnTypologyId: 1,
      columnColorId: 4,
      columnImage: 'MagliettaBurgundy1.jpg',
    };
    Map<String, dynamic> goodImage21 = {
      columnId: 21,
      columnTypologyId: 1,
      columnColorId: 4,
      columnImage: 'MagliettaBurgundy2.jpg',
    };
    Map<String, dynamic> goodImage22 = {
      columnId: 22,
      columnTypologyId: 1,
      columnColorId: 4,
      columnImage: 'MagliettaBurgundy3.jpg',
    };
    Map<String, dynamic> goodImage23 = {
      columnId: 23,
      columnTypologyId: 1,
      columnColorId: 4,
      columnImage: 'MagliettaBurgundy4.jpg',
    };
    Map<String, dynamic> goodImage24 = {
      columnId: 24,
      columnTypologyId: 1,
      columnColorId: 4,
      columnImage: 'MagliettaBurgundy5.jpg',
    };

    await db.insert(tableGoodImage, goodImage1);
    await db.insert(tableGoodImage, goodImage2);
    await db.insert(tableGoodImage, goodImage3);
    await db.insert(tableGoodImage, goodImage4);
    await db.insert(tableGoodImage, goodImage5);
    await db.insert(tableGoodImage, goodImage6);
    await db.insert(tableGoodImage, goodImage7);
    await db.insert(tableGoodImage, goodImage8);
    await db.insert(tableGoodImage, goodImage9);
    await db.insert(tableGoodImage, goodImage10);
    await db.insert(tableGoodImage, goodImage11);
    await db.insert(tableGoodImage, goodImage12);
    await db.insert(tableGoodImage, goodImage13);
    await db.insert(tableGoodImage, goodImage14);
    await db.insert(tableGoodImage, goodImage15);
    await db.insert(tableGoodImage, goodImage16);
    await db.insert(tableGoodImage, goodImage17);
    await db.insert(tableGoodImage, goodImage18);
    await db.insert(tableGoodImage, goodImage19);
    await db.insert(tableGoodImage, goodImage20);
    await db.insert(tableGoodImage, goodImage21);
    await db.insert(tableGoodImage, goodImage22);
    await db.insert(tableGoodImage, goodImage23);
    await db.insert(tableGoodImage, goodImage24);

    print("Fine Inserimento dati tabella $tableGoodImage");
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

    var whereString = " WHERE $tableTypology.$columnVendorId=$vendorId";

    if (genderFilter > -1) {
      whereString += " AND ($columnGender = ${genderFilter.toString()})";
    }

    if (categoryIds.length > 0) {
      whereString += " AND (";
      for (var i = 0; i < categoryIds.length; i++) {
        whereString += "($columnCategoryId = ${categoryIds[i].toString()}) OR ";
      }
      whereString = whereString.substring(0, whereString.length - 3);
      whereString += ")";
    }

    query += whereString;

    result = await db.rawQuery(query);

    return result;
  }

  Future<List<Map>> getAllSports() async {
    Database db = await instance.database;

    List<String> columnsToSelect = [columnId, columnName, columnIcon];

    List<Map> result = await db.query(tableSport, columns: columnsToSelect);

    return result;
  }

  Future<List<Map>> getColorsByTypology(int typologyId) async {
    Database db = await instance.database;

    List<Map> result = await db.rawQuery(
        '''SELECT DISTINCT $tableColor.* FROM $tableColor INNER JOIN $tableGood ON $tableColor.$columnId = $tableGood.$columnColorId WHERE $tableGood.$columnTypologyId = ?''',
        [typologyId]);
    return result;
  }

  Future<List<Map>> getGoodsByTypology(int typologyId) async {
    Database db = await instance.database;

    List<Map> result = await db.rawQuery(
        '''SELECT $tableGood.* FROM $tableGood INNER JOIN $tableTypology ON $tableTypology.$columnId = $tableGood.$columnTypologyId WHERE $tableTypology.$columnId = ?''',
        [typologyId]);
    return result;
  }

  Future<List<Map>> getVendorsByCategorySportText(
      String name, List<int> categories, List<int> sports) async {
    Database db = await instance.database;

    List<Map> result;
    var selectClause = "SELECT DISTINCT $tableVendor.*";
    var fromClause = "FROM $tableVendor";
    var whereClause = "WHERE $tableVendor.$columnName LIKE '%$name%'";

    if (categories.length > 0) {
      fromClause += ", $tableVendorCategory";
      whereClause +=
          "AND $tableVendor.$columnId = $tableVendorCategory.$columnVendorId AND (";
      categories.forEach((element) {
        whereClause += " $tableVendorCategory.$columnCategoryId = $element OR";
      });
      whereClause = whereClause.substring(0, whereClause.length - 3);
      whereClause += ")";
    }

    if (sports.length > 0) {
      fromClause += ", $tableVendorSport";
      whereClause +=
          "AND $tableVendor.$columnId = $tableVendorSport.$columnVendorId AND (";
      sports.forEach((element) {
        whereClause += " $tableVendorSport.$columnSportId = $element OR";
      });
      whereClause = whereClause.substring(0, whereClause.length - 3);
      whereClause += ")";
    }

    var query = "$selectClause $fromClause $whereClause";
    result = await db.rawQuery(query);

    return result;
  }

  Future<List<Map>> getAvailableSizesByTypologyAndColor(
      int typologyId, int colorId) async {
    Database db = await instance.database;

    var sql =
        '''SELECT DISTINCT $tableSize.* FROM $tableSize INNER JOIN $tableGood ON $tableSize.$columnId = $tableGood.$columnSizeId WHERE $tableGood.$columnTypologyId = $typologyId AND $tableGood.$columnColorId = $colorId AND $tableGood.$columnQuantity > 0 ''';
    List<Map> result = await db.rawQuery(sql);
    return result;
  }

  Future<List<Map>> getGoodImagesByTypologyAndColor(
      int typologyId, int colorId) async {
    Database db = await instance.database;

    List<Map> result = await db.rawQuery(
        '''SELECT DISTINCT $tableGoodImage.* FROM $tableGoodImage WHERE $tableGoodImage.$columnTypologyId = ? AND $tableGoodImage.$columnColorId = ?''',
        [typologyId, colorId]);
    return result;
  }

  Future<List<Map>> getFrontTypologyImages(int vendorId) async {
    Database db = await instance.database;

    List<Map> result = await db.rawQuery(
        '''SELECT $tableTypology.$columnImage FROM $tableTypology INNER JOIN $tableVendor WHERE $tableTypology.$columnVendorId = ? LIMIT 6''',
        [vendorId]);
    return result;
  }

/*+++++++++++ da verificare +++++++++++++++++++  */

  Future<List<Map>> getGood(int typologyId, int colorId, int sizeId) async {
    Database db = await instance.database;

    List<Map> result = await db.rawQuery(
      '''SELECT DISTINCT $tableGood.* FROM $tableGood WHERE $tableGood.$columnTypologyId = $typologyId AND $tableGood.$columnColorId = $colorId AND $tableGood.$columnSizeId = $sizeId''',
    );
    return result;
  }
}
