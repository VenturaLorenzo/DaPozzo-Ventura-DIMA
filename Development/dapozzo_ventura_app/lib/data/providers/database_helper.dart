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
  static final tableUser = "User";
  static final tableShipAdd = "ShippingAddress";
  static final tableUserShipping = "UserShippingAddress";

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
  static final columnEmail = 'Email';
  static final columnSurname = 'Surname';
  static final columnPhone = 'PhoneNumber';
  static final columnPassword = 'Password';
  static final columnUserId = 'UserId';
  static final columnAddress = 'Address';
  static final columnAppartNum = 'AppartamentNumber';
  static final columnAddrInfo = 'AddressInfo';
  static final columnComune = 'Comune';
  static final columnCountry = 'Country';
  static final columnStreetAddr = 'StreetAddress';
  static final columnDefaultAddr = 'DefaultAddress';
  static final columnShippingId = 'ShippingId';

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
            $columnId INTEGER NOT NULL,  
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

    // SQL code to create the database table USER
    print("Creazione tabella $tableUser");
    await db.execute(''' CREATE TABLE $tableUser (   
            $columnId INTEGER NOT NULL,
            $columnEmail STRING NOT NULL,              
            $columnName STRING NOT NULL,
            $columnSurname STRING NOT NULL,
            $columnPhone INTEGER NOT NULL,
            $columnImage TEXT NOT NULL,
            $columnPassword STRING NOT NULL,
            PRIMARY KEY ($columnId)      
          )''');
    print("Creazione tabella $tableUser TERMINATA");

    // SQL code to create the database table SHIPPING
    print("Creazione tabella $tableShipAdd");
    await db.execute(''' CREATE TABLE $tableShipAdd (   
            $columnId INTEGER NOT NULL,
            $columnUserId INTEGER NOT NULL,
            $columnAddress STRING NOT NULL,
            $columnAppartNum INTEGER NOT NULL,
            $columnAddrInfo STRING,
            $columnComune STRING NOT NULL,
            $columnCountry STRING NOT NULL,
            $columnStreetAddr STRING NOT NULL,
            $columnDefaultAddr STRING NOT NULL,            
            PRIMARY KEY ($columnId)      
          )''');
    print("Creazione tabella $tableShipAdd TERMINATA");

    // SQL code to create the database table USERSHIPPING
    print("Creazione tabella $tableUserShipping");
    await db.execute(''' CREATE TABLE $tableUserShipping (   
            $columnUserId INTEGER NOT NULL,              
            $columnShippingId INTEGER NOT NULL,
            PRIMARY KEY ($columnUserId,$columnShippingId)      
          )''');
    print("Creazione tabella $tableUserShipping TERMINATA");

    /*++++++++++++++++++++++++++++++++++    INSERIMENTO DATI IN TABELLE    +++++++++++++++++++++++++++++++++++++++++*/

    /*TABELLA USER*/
    print("inserisco dati tabella $tableUser");
    Map<String, dynamic> user1 = {
      columnId: 1,
      columnEmail: 'andrea.dapozzo3@gmail.com',
      columnName: 'Andrea',
      columnSurname: 'Da Pozzo',
      columnPhone: '3347999757',
      columnImage: 'Cappellino.jpg',
      columnPassword: 'Andrea0409'
    };
    await db.insert(tableUser, user1);
    print("inserimento dati tabella $tableUser TERMINATO");

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
      columnImage: 'MagliettaBlack4.jpg',
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
      columnName: 'Rash',
      columnDescription: 'Questa è una maglietta stylish',
      columnPrice: '35'
    };
    Map<String, dynamic> goodsTypology3 = {
      columnId: 3,
      columnVendorId: 1,
      columnCategoryId: 2,
      columnGender: 0,
      columnImage: 'Spiro.jpg',
      columnName: 'AllBlack',
      columnDescription: 'Elasticizzato',
      columnPrice: '25'
    };
    Map<String, dynamic> goodsTypology4 = {
      columnId: 4,
      columnVendorId: 1,
      columnCategoryId: 2,
      columnGender: 0,
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
    Map<String, dynamic> goodsTypology12 = {
      columnId: 12,
      columnVendorId: 1,
      columnCategoryId: 1,
      columnGender: 1,
      columnImage: 'MagliettaRoyalblue1.jpg',
      columnName: 'Easy',
      columnDescription: 'Questa è una maglietta semplice',
      columnPrice: '15'
    };
    Map<String, dynamic> goodsTypology13 = {
      columnId: 13,
      columnVendorId: 1,
      columnCategoryId: 1,
      columnGender: 1,
      columnImage: 'RashDonna.jpg',
      columnName: 'Rash',
      columnDescription: 'Questa è una maglietta stylish',
      columnPrice: '35'
    };
    Map<String, dynamic> goodsTypology14 = {
      columnId: 14,
      columnVendorId: 3,
      columnCategoryId: 8,
      columnGender: 1,
      columnImage: 'CappellinoRosso1.jpg',
      columnName: 'Kap',
      columnDescription: 'Perfetto per la montagna',
      columnPrice: '30'
    };
    Map<String, dynamic> goodsTypology15 = {
      columnId: 15,
      columnVendorId: 3,
      columnCategoryId: 8,
      columnGender: 0,
      columnImage: 'CappellinoDarkGrey1.jpg',
      columnName: 'Kap',
      columnDescription: 'Perfetto per la montagna',
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
    await db.insert(tableTypology, goodsTypology12);
    await db.insert(tableTypology, goodsTypology13);
    await db.insert(tableTypology, goodsTypology14);
    await db.insert(tableTypology, goodsTypology15);
    print("Fine inserimento dati tabella $tableTypology");

    /*TABELLA CATEGORY*/
    print("Inserimento dati tabella $tableCategory");
    Map<String, dynamic> goodsCategory1 = {
      columnId: 1,
      columnName: 'Maglietta',
      columnIcon: 'tshirt.png'
    };
    Map<String, dynamic> goodsCategory2 = {
      columnId: 2,
      columnName: 'Pantaloncino',
      columnIcon: 'shorts.png'
    };
    Map<String, dynamic> goodsCategory3 = {
      columnId: 3,
      columnName: 'Kimono',
      columnIcon: '024-kimono.png'
    };
    Map<String, dynamic> goodsCategory4 = {
      columnId: 4,
      columnName: 'Cintura',
      columnIcon: '004-blackbelt.png'
    };
    Map<String, dynamic> goodsCategory5 = {
      columnId: 5,
      columnName: 'Felpa',
      columnIcon: 'sweater.png'
    };
    Map<String, dynamic> goodsCategory6 = {
      columnId: 6,
      columnName: 'Tuta',
      columnIcon: 'joggerpants.png'
    };
    Map<String, dynamic> goodsCategory7 = {
      columnId: 7,
      columnName: 'Gloves',
      columnIcon: 'glove.png'
    };
    Map<String, dynamic> goodsCategory8 = {
      columnId: 8,
      columnName: 'Cappellino',
      columnIcon: 'winterhat.png'
    };

    await db.insert(tableCategory, goodsCategory1);
    await db.insert(tableCategory, goodsCategory2);
    await db.insert(tableCategory, goodsCategory3);
    await db.insert(tableCategory, goodsCategory4);
    await db.insert(tableCategory, goodsCategory5);
    await db.insert(tableCategory, goodsCategory6);
    await db.insert(tableCategory, goodsCategory7);
    await db.insert(tableCategory, goodsCategory8);
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
    // Map<String, dynamic> vendorCategory3 = {
    //   columnVendorId: 1,
    //   columnCategoryId: 3,
    // };
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
    Map<String, dynamic> vendorCategory9 = {
      columnVendorId: 3,
      columnCategoryId: 8,
    };
    await db.insert(tableVendorCategory, vendorCategory1);
    await db.insert(tableVendorCategory, vendorCategory2);
    // await db.insert(tableVendorCategory, vendorCategory3);
    await db.insert(tableVendorCategory, vendorCategory4);
    await db.insert(tableVendorCategory, vendorCategory5);
    // await db.insert(tableVendorCategory, vendorCategory6);
    await db.insert(tableVendorCategory, vendorCategory7);
    await db.insert(tableVendorCategory, vendorCategory8);
    await db.insert(tableVendorCategory, vendorCategory9);
    print("Fine Inserimento dati tabella $tableVendorCategory");

    /*TABELLA SPORT*/
    print("Inserimento dati tabella $tableSport");
    Map<String, dynamic> sport1 = {
      columnId: 1,
      columnName: 'Bjj',
      columnIcon: '024-kimono.png'
    };
    Map<String, dynamic> sport2 = {
      columnId: 2,
      columnName: 'MMA',
      columnIcon: 'mma.png'
    };
    Map<String, dynamic> sport3 = {
      columnId: 3,
      columnName: 'skateboard',
      columnIcon: '002-skateboard.png'
    };
    Map<String, dynamic> sport4 = {
      columnId: 4,
      columnName: 'Tennnis',
      columnIcon: '014-tennis.png'
    };
    Map<String, dynamic> sport5 = {
      columnId: 5,
      columnName: 'Montagna',
      columnIcon: 'montagna.png'
    };
    Map<String, dynamic> sport6 = {
      columnId: 6,
      columnName: 'Funzionale',
      columnIcon: '036-functional.png'
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
    Map<String, dynamic> color6 = {
      columnId: 6,
      columnName: 'DarkGrey',
      columnCode: 'A9A9A9',
    };
    await db.insert(tableColor, color1);
    await db.insert(tableColor, color2);
    await db.insert(tableColor, color3);
    await db.insert(tableColor, color4);
    await db.insert(tableColor, color5);
    await db.insert(tableColor, color6);
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
    Map<String, dynamic> size5 = {
      columnId: 5,
      columnName: 'XS/S',
    };
    Map<String, dynamic> size6 = {
      columnId: 6,
      columnName: 'M/L',
    };
    Map<String, dynamic> size7 = {
      columnId: 7,
      columnName: 'F0',
    };
    Map<String, dynamic> size8 = {
      columnId: 8,
      columnName: 'F1',
    };
    Map<String, dynamic> size9 = {
      columnId: 9,
      columnName: 'F2',
    };
    Map<String, dynamic> size10 = {
      columnId: 10,
      columnName: 'F3',
    };
    Map<String, dynamic> size11 = {
      columnId: 11,
      columnName: 'F4',
    };
    Map<String, dynamic> size12 = {
      columnId: 12,
      columnName: 'A0',
    };
    Map<String, dynamic> size13 = {
      columnId: 13,
      columnName: 'A1',
    };
    Map<String, dynamic> size14 = {
      columnId: 14,
      columnName: 'A2',
    };
    Map<String, dynamic> size15 = {
      columnId: 15,
      columnName: 'A3',
    };
    Map<String, dynamic> size16 = {
      columnId: 16,
      columnName: 'A4',
    };
    Map<String, dynamic> size17 = {
      columnId: 17,
      columnName: 'Unica',
    };
    Map<String, dynamic> size18 = {
      columnId: 18,
      columnName: 'XL/2XL',
    };

    await db.insert(tableSize, size1);
    await db.insert(tableSize, size2);
    await db.insert(tableSize, size3);
    await db.insert(tableSize, size4);
    await db.insert(tableSize, size5);
    await db.insert(tableSize, size6);
    await db.insert(tableSize, size7);
    await db.insert(tableSize, size8);
    await db.insert(tableSize, size9);
    await db.insert(tableSize, size10);
    await db.insert(tableSize, size11);
    await db.insert(tableSize, size12);
    await db.insert(tableSize, size13);
    await db.insert(tableSize, size14);
    await db.insert(tableSize, size15);
    await db.insert(tableSize, size16);
    await db.insert(tableSize, size17);
    await db.insert(tableSize, size18);
    print("Fine Inserimento dati tabella $tableSize");

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
    Map<String, dynamic> good53 = {
      columnId: 53,
      columnTypologyId: 3,
      columnColorId: 1,
      columnSizeId: 5,
      columnQuantity: 100,
    };
    Map<String, dynamic> good54 = {
      columnId: 54,
      columnTypologyId: 3,
      columnColorId: 1,
      columnSizeId: 6,
      columnQuantity: 100,
    };
    Map<String, dynamic> good55 = {
      columnId: 55,
      columnTypologyId: 3,
      columnColorId: 1,
      columnSizeId: 18,
      columnQuantity: 100,
    };
    Map<String, dynamic> good56 = {
      columnId: 56,
      columnTypologyId: 2,
      columnColorId: 3,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good57 = {
      columnId: 57,
      columnTypologyId: 2,
      columnColorId: 3,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good58 = {
      columnId: 58,
      columnTypologyId: 2,
      columnColorId: 3,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good59 = {
      columnId: 59,
      columnTypologyId: 2,
      columnColorId: 3,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good60 = {
      columnId: 60,
      columnTypologyId: 12,
      columnColorId: 3,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good61 = {
      columnId: 61,
      columnTypologyId: 12,
      columnColorId: 3,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good62 = {
      columnId: 62,
      columnTypologyId: 12,
      columnColorId: 3,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good63 = {
      columnId: 63,
      columnTypologyId: 12,
      columnColorId: 3,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good64 = {
      columnId: 64,
      columnTypologyId: 12,
      columnColorId: 4,
      columnSizeId: 1,
      columnQuantity: 0,
    };
    Map<String, dynamic> good65 = {
      columnId: 65,
      columnTypologyId: 12,
      columnColorId: 1,
      columnSizeId: 1,
      columnQuantity: 0,
    };
    Map<String, dynamic> good66 = {
      columnId: 66,
      columnTypologyId: 12,
      columnColorId: 1,
      columnSizeId: 2,
      columnQuantity: 0,
    };
    Map<String, dynamic> good67 = {
      columnId: 67,
      columnTypologyId: 12,
      columnColorId: 1,
      columnSizeId: 3,
      columnQuantity: 0,
    };
    Map<String, dynamic> good68 = {
      columnId: 68,
      columnTypologyId: 12,
      columnColorId: 1,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good69 = {
      columnId: 69,
      columnTypologyId: 12,
      columnColorId: 4,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good70 = {
      columnId: 70,
      columnTypologyId: 12,
      columnColorId: 4,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good71 = {
      columnId: 71,
      columnTypologyId: 12,
      columnColorId: 4,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good72 = {
      columnId: 72,
      columnTypologyId: 13,
      columnColorId: 2,
      columnSizeId: 1,
      columnQuantity: 100,
    };
    Map<String, dynamic> good73 = {
      columnId: 73,
      columnTypologyId: 13,
      columnColorId: 2,
      columnSizeId: 2,
      columnQuantity: 100,
    };
    Map<String, dynamic> good74 = {
      columnId: 74,
      columnTypologyId: 13,
      columnColorId: 2,
      columnSizeId: 3,
      columnQuantity: 100,
    };
    Map<String, dynamic> good75 = {
      columnId: 75,
      columnTypologyId: 13,
      columnColorId: 2,
      columnSizeId: 4,
      columnQuantity: 100,
    };
    Map<String, dynamic> good76 = {
      columnId: 76,
      columnTypologyId: 6,
      columnColorId: 1,
      columnSizeId: 12,
      columnQuantity: 100,
    };
    Map<String, dynamic> good77 = {
      columnId: 77,
      columnTypologyId: 6,
      columnColorId: 1,
      columnSizeId: 13,
      columnQuantity: 100,
    };
    Map<String, dynamic> good78 = {
      columnId: 78,
      columnTypologyId: 6,
      columnColorId: 1,
      columnSizeId: 14,
      columnQuantity: 100,
    };
    Map<String, dynamic> good79 = {
      columnId: 79,
      columnTypologyId: 6,
      columnColorId: 1,
      columnSizeId: 15,
      columnQuantity: 100,
    };
    Map<String, dynamic> good80 = {
      columnId: 80,
      columnTypologyId: 6,
      columnColorId: 1,
      columnSizeId: 16,
      columnQuantity: 100,
    };
    Map<String, dynamic> good81 = {
      columnId: 81,
      columnTypologyId: 6,
      columnColorId: 3,
      columnSizeId: 12,
      columnQuantity: 100,
    };
    Map<String, dynamic> good82 = {
      columnId: 82,
      columnTypologyId: 6,
      columnColorId: 3,
      columnSizeId: 13,
      columnQuantity: 100,
    };
    Map<String, dynamic> good83 = {
      columnId: 83,
      columnTypologyId: 6,
      columnColorId: 3,
      columnSizeId: 14,
      columnQuantity: 100,
    };
    Map<String, dynamic> good84 = {
      columnId: 84,
      columnTypologyId: 6,
      columnColorId: 3,
      columnSizeId: 15,
      columnQuantity: 100,
    };
    Map<String, dynamic> good85 = {
      columnId: 85,
      columnTypologyId: 6,
      columnColorId: 3,
      columnSizeId: 16,
      columnQuantity: 100,
    };
    Map<String, dynamic> good86 = {
      columnId: 86,
      columnTypologyId: 7,
      columnColorId: 2,
      columnSizeId: 7,
      columnQuantity: 100,
    };
    Map<String, dynamic> good87 = {
      columnId: 87,
      columnTypologyId: 7,
      columnColorId: 2,
      columnSizeId: 8,
      columnQuantity: 100,
    };
    Map<String, dynamic> good88 = {
      columnId: 88,
      columnTypologyId: 7,
      columnColorId: 2,
      columnSizeId: 9,
      columnQuantity: 100,
    };
    Map<String, dynamic> good89 = {
      columnId: 89,
      columnTypologyId: 7,
      columnColorId: 2,
      columnSizeId: 10,
      columnQuantity: 100,
    };
    Map<String, dynamic> good90 = {
      columnId: 90,
      columnTypologyId: 7,
      columnColorId: 2,
      columnSizeId: 11,
      columnQuantity: 100,
    };
    Map<String, dynamic> good91 = {
      columnId: 91,
      columnTypologyId: 7,
      columnColorId: 1,
      columnSizeId: 7,
      columnQuantity: 100,
    };
    Map<String, dynamic> good92 = {
      columnId: 92,
      columnTypologyId: 7,
      columnColorId: 1,
      columnSizeId: 8,
      columnQuantity: 100,
    };
    Map<String, dynamic> good93 = {
      columnId: 93,
      columnTypologyId: 7,
      columnColorId: 1,
      columnSizeId: 9,
      columnQuantity: 100,
    };
    Map<String, dynamic> good94 = {
      columnId: 94,
      columnTypologyId: 7,
      columnColorId: 1,
      columnSizeId: 10,
      columnQuantity: 100,
    };
    Map<String, dynamic> good95 = {
      columnId: 95,
      columnTypologyId: 7,
      columnColorId: 1,
      columnSizeId: 11,
      columnQuantity: 100,
    };
    Map<String, dynamic> good96 = {
      columnId: 96,
      columnTypologyId: 15,
      columnColorId: 6,
      columnSizeId: 17,
      columnQuantity: 100,
    };
    Map<String, dynamic> good97 = {
      columnId: 97,
      columnTypologyId: 14,
      columnColorId: 4,
      columnSizeId: 17,
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
    await db.insert(tableGood, good53);
    await db.insert(tableGood, good54);
    await db.insert(tableGood, good55);
    await db.insert(tableGood, good56);
    await db.insert(tableGood, good57);
    await db.insert(tableGood, good58);
    await db.insert(tableGood, good59);
    await db.insert(tableGood, good60);
    await db.insert(tableGood, good61);
    await db.insert(tableGood, good62);
    await db.insert(tableGood, good63);
    await db.insert(tableGood, good64);
    await db.insert(tableGood, good65);
    await db.insert(tableGood, good66);
    await db.insert(tableGood, good67);
    await db.insert(tableGood, good68);
    await db.insert(tableGood, good69);
    await db.insert(tableGood, good70);
    await db.insert(tableGood, good71);
    await db.insert(tableGood, good72);
    await db.insert(tableGood, good73);
    await db.insert(tableGood, good74);
    await db.insert(tableGood, good75);
    await db.insert(tableGood, good76);
    await db.insert(tableGood, good77);
    await db.insert(tableGood, good78);
    await db.insert(tableGood, good79);
    await db.insert(tableGood, good80);
    await db.insert(tableGood, good81);
    await db.insert(tableGood, good82);
    await db.insert(tableGood, good83);
    await db.insert(tableGood, good84);
    await db.insert(tableGood, good85);
    await db.insert(tableGood, good86);
    await db.insert(tableGood, good87);
    await db.insert(tableGood, good88);
    await db.insert(tableGood, good89);
    await db.insert(tableGood, good90);
    await db.insert(tableGood, good91);
    await db.insert(tableGood, good92);
    await db.insert(tableGood, good93);
    await db.insert(tableGood, good94);
    await db.insert(tableGood, good95);
    await db.insert(tableGood, good96);
    await db.insert(tableGood, good97);
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
      columnTypologyId: 12,
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
      columnTypologyId: 12,
      columnColorId: 1,
      columnImage: 'MagliettaBlack5.jpg',
    };
    Map<String, dynamic> goodImage15 = {
      columnId: 15,
      columnTypologyId: 12,
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
      columnTypologyId: 12,
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
      columnTypologyId: 12,
      columnColorId: 4,
      columnImage: 'MagliettaBurgundy1.jpg',
    };
    Map<String, dynamic> goodImage21 = {
      columnId: 21,
      columnTypologyId: 12,
      columnColorId: 4,
      columnImage: 'MagliettaBurgundy2.jpg',
    };
    Map<String, dynamic> goodImage22 = {
      columnId: 22,
      columnTypologyId: 12,
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
    Map<String, dynamic> goodImage25 = {
      columnId: 25,
      columnTypologyId: 3,
      columnColorId: 1,
      columnImage: 'SpiroBlack1.jpg',
    };
    Map<String, dynamic> goodImage26 = {
      columnId: 26,
      columnTypologyId: 3,
      columnColorId: 1,
      columnImage: 'SpiroBlack2.jpg',
    };
    Map<String, dynamic> goodImage27 = {
      columnId: 27,
      columnTypologyId: 3,
      columnColorId: 1,
      columnImage: 'SpiroBlack3.jpg',
    };
    Map<String, dynamic> goodImage28 = {
      columnId: 28,
      columnTypologyId: 3,
      columnColorId: 1,
      columnImage: 'SpiroBlack4.jpg',
    };
    Map<String, dynamic> goodImage29 = {
      columnId: 29,
      columnTypologyId: 3,
      columnColorId: 1,
      columnImage: 'SpiroBlack5.jpg',
    };
    Map<String, dynamic> goodImage30 = {
      columnId: 30,
      columnTypologyId: 2,
      columnColorId: 3,
      columnImage: 'RashUomoBlue1.jpg',
    };
    Map<String, dynamic> goodImage31 = {
      columnId: 31,
      columnTypologyId: 2,
      columnColorId: 3,
      columnImage: 'RashUomoBlue2.jpg',
    };
    Map<String, dynamic> goodImage32 = {
      columnId: 32,
      columnTypologyId: 2,
      columnColorId: 3,
      columnImage: 'RashUomoBlue3.jpg',
    };
    Map<String, dynamic> goodImage33 = {
      columnId: 33,
      columnTypologyId: 2,
      columnColorId: 3,
      columnImage: 'RashUomoBlue4.jpg',
    };
    Map<String, dynamic> goodImage34 = {
      columnId: 34,
      columnTypologyId: 2,
      columnColorId: 3,
      columnImage: 'RashUomoBlue5.jpg',
    };
    Map<String, dynamic> goodImage35 = {
      columnId: 35,
      columnTypologyId: 13,
      columnColorId: 2,
      columnImage: 'RashDonnaBianco1.jpg',
    };
    Map<String, dynamic> goodImage36 = {
      columnId: 36,
      columnTypologyId: 13,
      columnColorId: 2,
      columnImage: 'RashDonnaBianco2.jpg',
    };
    Map<String, dynamic> goodImage37 = {
      columnId: 37,
      columnTypologyId: 13,
      columnColorId: 2,
      columnImage: 'RashDonnaBianco3.jpg',
    };
    Map<String, dynamic> goodImage38 = {
      columnId: 38,
      columnTypologyId: 13,
      columnColorId: 2,
      columnImage: 'RashDonnaBianco4.jpg',
    };
    Map<String, dynamic> goodImage39 = {
      columnId: 39,
      columnTypologyId: 13,
      columnColorId: 2,
      columnImage: 'RashDonnaBianco5.jpg',
    };
    Map<String, dynamic> goodImage40 = {
      columnId: 40,
      columnTypologyId: 6,
      columnColorId: 1,
      columnImage: 'KimonoUomoBlack1.jpg',
    };
    Map<String, dynamic> goodImage41 = {
      columnId: 41,
      columnTypologyId: 6,
      columnColorId: 1,
      columnImage: 'KimonoUomoBlack2.jpg',
    };
    // Map<String, dynamic> goodImage42 = {
    //   columnId: 42,
    //   columnTypologyId: 6,
    //   columnColorId: 1,
    //   columnImage: 'KimonoUomoBlack3.jpg',
    // };
    // Map<String, dynamic> goodImage43 = {
    //   columnId: 43,
    //   columnTypologyId: 6,
    //   columnColorId: 1,
    //   columnImage: 'KimonoUomoBlack4.jpg',
    // };
    // Map<String, dynamic> goodImage44 = {
    //   columnId: 44,
    //   columnTypologyId: 6,
    //   columnColorId: 1,
    //   columnImage: 'KimonoUomoBlack5.jpg',
    // };
    Map<String, dynamic> goodImage45 = {
      columnId: 45,
      columnTypologyId: 6,
      columnColorId: 3,
      columnImage: 'KimonoUomoBlue1.jpg',
    };
    Map<String, dynamic> goodImage46 = {
      columnId: 46,
      columnTypologyId: 6,
      columnColorId: 3,
      columnImage: 'KimonoUomoBlue2.jpg',
    };
    Map<String, dynamic> goodImage47 = {
      columnId: 47,
      columnTypologyId: 6,
      columnColorId: 3,
      columnImage: 'KimonoUomoBlue3.jpg',
    };
    Map<String, dynamic> goodImage48 = {
      columnId: 48,
      columnTypologyId: 6,
      columnColorId: 3,
      columnImage: 'KimonoUomoBlue4.jpg',
    };
    Map<String, dynamic> goodImage49 = {
      columnId: 49,
      columnTypologyId: 6,
      columnColorId: 3,
      columnImage: 'KimonoUomoBlue5.jpg',
    };
    Map<String, dynamic> goodImage50 = {
      columnId: 50,
      columnTypologyId: 7,
      columnColorId: 2,
      columnImage: 'KimonoDonnaBianco1.jpg',
    };
    Map<String, dynamic> goodImage51 = {
      columnId: 51,
      columnTypologyId: 7,
      columnColorId: 2,
      columnImage: 'KimonoDonnaBianco2.jpg',
    };
    Map<String, dynamic> goodImage52 = {
      columnId: 52,
      columnTypologyId: 7,
      columnColorId: 2,
      columnImage: 'KimonoDonnaBianco3.jpg',
    };
    Map<String, dynamic> goodImage53 = {
      columnId: 53,
      columnTypologyId: 7,
      columnColorId: 2,
      columnImage: 'KimonoDonnaBianco4.jpg',
    };
    Map<String, dynamic> goodImage54 = {
      columnId: 54,
      columnTypologyId: 7,
      columnColorId: 1,
      columnImage: 'KimonoDonnaBlack1.jpg',
    };
    Map<String, dynamic> goodImage55 = {
      columnId: 55,
      columnTypologyId: 7,
      columnColorId: 1,
      columnImage: 'KimonoDonnaBlack2.jpg',
    };
    Map<String, dynamic> goodImage56 = {
      columnId: 56,
      columnTypologyId: 7,
      columnColorId: 1,
      columnImage: 'KimonoDonnaBlack3.jpg',
    };
    Map<String, dynamic> goodImage57 = {
      columnId: 57,
      columnTypologyId: 7,
      columnColorId: 1,
      columnImage: 'KimonoDonnaBlack4.jpg',
    };
    Map<String, dynamic> goodImage58 = {
      columnId: 58,
      columnTypologyId: 7,
      columnColorId: 1,
      columnImage: 'KimonoDonnaBlack5.jpg',
    };
    Map<String, dynamic> goodImage59 = {
      columnId: 59,
      columnTypologyId: 14,
      columnColorId: 4,
      columnImage: 'CappellinoRosso1.jpg',
    };
    Map<String, dynamic> goodImage60 = {
      columnId: 60,
      columnTypologyId: 14,
      columnColorId: 4,
      columnImage: 'CappellinoRosso2.jpg',
    };
    Map<String, dynamic> goodImage61 = {
      columnId: 61,
      columnTypologyId: 14,
      columnColorId: 4,
      columnImage: 'CappellinoRosso3.jpg',
    };
    Map<String, dynamic> goodImage62 = {
      columnId: 62,
      columnTypologyId: 15,
      columnColorId: 6,
      columnImage: 'CappellinoDarkGrey1.jpg',
    };
    Map<String, dynamic> goodImage63 = {
      columnId: 63,
      columnTypologyId: 15,
      columnColorId: 6,
      columnImage: 'CappellinoDarkGrey2.jpg',
    };
    Map<String, dynamic> goodImage64 = {
      columnId: 64,
      columnTypologyId: 15,
      columnColorId: 6,
      columnImage: 'CappellinoDarkGrey3.jpg',
    };
    Map<String, dynamic> goodImage65 = {
      columnId: 65,
      columnTypologyId: 15,
      columnColorId: 6,
      columnImage: 'CappellinoDarkGrey4.jpg',
    };
    Map<String, dynamic> goodImage66 = {
      columnId: 66,
      columnTypologyId: 15,
      columnColorId: 6,
      columnImage: 'CappellinoDarkGrey5.jpg',
    };
    Map<String, dynamic> goodImage67 = {
      columnId: 67,
      columnTypologyId: 10,
      columnColorId: 4,
      columnImage: 'FelpaLeggeraBurgundy1.jpg',
    };
    Map<String, dynamic> goodImage68 = {
      columnId: 68,
      columnTypologyId: 10,
      columnColorId: 4,
      columnImage: 'FelpaLeggeraBurgundy2.jpg',
    };
    Map<String, dynamic> goodImage69 = {
      columnId: 69,
      columnTypologyId: 10,
      columnColorId: 4,
      columnImage: 'FelpaLeggeraBurgundy3.jpg',
    };
    Map<String, dynamic> goodImage70 = {
      columnId: 70,
      columnTypologyId: 10,
      columnColorId: 4,
      columnImage: 'FelpaLeggeraBurgundy4.jpg',
    };
    Map<String, dynamic> goodImage71 = {
      columnId: 71,
      columnTypologyId: 10,
      columnColorId: 4,
      columnImage: 'FelpaLeggeraBurgundy5.jpg',
    };
    Map<String, dynamic> goodImage72 = {
      columnId: 72,
      columnTypologyId: 10,
      columnColorId: 5,
      columnImage: 'FelpaLeggeraGrigio1.jpg',
    };
    Map<String, dynamic> goodImage73 = {
      columnId: 73,
      columnTypologyId: 10,
      columnColorId: 5,
      columnImage: 'FelpaLeggeraGrigio2.jpg',
    };
    Map<String, dynamic> goodImage74 = {
      columnId: 74,
      columnTypologyId: 10,
      columnColorId: 5,
      columnImage: 'FelpaLeggeraGrigio4.jpg',
    };
    Map<String, dynamic> goodImage75 = {
      columnId: 75,
      columnTypologyId: 11,
      columnColorId: 5,
      columnImage: 'FelpaLeggeraGrigio3.jpg',
    };
    Map<String, dynamic> goodImage76 = {
      columnId: 76,
      columnTypologyId: 11,
      columnColorId: 5,
      columnImage: 'FelpaLeggeraGrigio5.jpg',
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
    await db.insert(tableGoodImage, goodImage25);
    await db.insert(tableGoodImage, goodImage26);
    await db.insert(tableGoodImage, goodImage27);
    await db.insert(tableGoodImage, goodImage28);
    await db.insert(tableGoodImage, goodImage29);
    await db.insert(tableGoodImage, goodImage30);
    await db.insert(tableGoodImage, goodImage31);
    await db.insert(tableGoodImage, goodImage32);
    await db.insert(tableGoodImage, goodImage33);
    await db.insert(tableGoodImage, goodImage34);
    await db.insert(tableGoodImage, goodImage35);
    await db.insert(tableGoodImage, goodImage36);
    await db.insert(tableGoodImage, goodImage37);
    await db.insert(tableGoodImage, goodImage38);
    await db.insert(tableGoodImage, goodImage39);
    await db.insert(tableGoodImage, goodImage40);
    await db.insert(tableGoodImage, goodImage41);
    // await db.insert(tableGoodImage, goodImage42);
    // await db.insert(tableGoodImage, goodImage43);
    // await db.insert(tableGoodImage, goodImage44);
    await db.insert(tableGoodImage, goodImage45);
    await db.insert(tableGoodImage, goodImage46);
    await db.insert(tableGoodImage, goodImage47);
    await db.insert(tableGoodImage, goodImage48);
    await db.insert(tableGoodImage, goodImage49);
    await db.insert(tableGoodImage, goodImage50);
    await db.insert(tableGoodImage, goodImage51);
    await db.insert(tableGoodImage, goodImage52);
    await db.insert(tableGoodImage, goodImage53);
    await db.insert(tableGoodImage, goodImage54);
    await db.insert(tableGoodImage, goodImage55);
    await db.insert(tableGoodImage, goodImage56);
    await db.insert(tableGoodImage, goodImage57);
    await db.insert(tableGoodImage, goodImage58);
    await db.insert(tableGoodImage, goodImage59);
    await db.insert(tableGoodImage, goodImage60);
    await db.insert(tableGoodImage, goodImage61);
    await db.insert(tableGoodImage, goodImage62);
    await db.insert(tableGoodImage, goodImage63);
    await db.insert(tableGoodImage, goodImage64);
    await db.insert(tableGoodImage, goodImage65);
    await db.insert(tableGoodImage, goodImage66);
    await db.insert(tableGoodImage, goodImage67);
    await db.insert(tableGoodImage, goodImage68);
    await db.insert(tableGoodImage, goodImage69);
    await db.insert(tableGoodImage, goodImage70);
    await db.insert(tableGoodImage, goodImage71);
    await db.insert(tableGoodImage, goodImage72);
    await db.insert(tableGoodImage, goodImage73);
    await db.insert(tableGoodImage, goodImage74);
    await db.insert(tableGoodImage, goodImage75);
    await db.insert(tableGoodImage, goodImage76);
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

  Future<List<Map>> getGood(int typologyId, int colorId, int sizeId) async {
    Database db = await instance.database;

    List<Map> result = await db.rawQuery(
      '''SELECT DISTINCT $tableGood.* FROM $tableGood WHERE $tableGood.$columnTypologyId = $typologyId AND $tableGood.$columnColorId = $colorId AND $tableGood.$columnSizeId = $sizeId''',
    );
    return result;
  }

  Future<List<Map>> getVendor(int vendorId) async {
    Database db = await instance.database;

    var sql =
        '''SELECT DISTINCT $tableVendor.$columnName FROM $tableVendor WHERE $tableVendor.$columnId = $vendorId''';
    List<Map> result = await db.rawQuery(sql);
    return result;
  }

/*+++++++++++ da verificare +++++++++++++++++++  */

  Future<bool> checkCredential(String insEmail, String insertedPassword) async {
    Database db = await instance.database;

    var sql =
        '''SELECT $tableUser.$columnPassword FROM $tableUser WHERE $tableUser.$columnEmail = ?''';
    List<Map> result = await db.rawQuery(sql, [insEmail]);
    var retVal =
        result.isNotEmpty && result[0][columnPassword] == insertedPassword;
    return retVal;
  }

  Future<List<Map>> getUser(String insEmail) async {
    Database db = await instance.database;

    List<Map> result = await db.rawQuery(
        '''SELECT $tableUser.$columnId,$tableUser.$columnEmail,$tableUser.$columnName,$tableUser.$columnSurname,$tableUser.$columnPhone,$tableUser.$columnImage FROM $tableUser WHERE $tableUser.$columnEmail = ?''',
        [insEmail]);
    return result;
  }
}
