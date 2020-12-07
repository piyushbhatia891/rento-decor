import 'dart:async';
import 'dart:io';

import 'package:eazy_shop/models/cart/cart_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _dbname = 'Orders.db';
  static final _tbl_name = 'CartOrders';
  static final id = 'id';
  static final price = 'price';
  static final quantity = 'quantity';
  static final _dbversion = 2;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory _directory = await getApplicationDocumentsDirectory();
    String path = join(_directory.path, _dbname);

    return await openDatabase(path, version: _dbversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    return db.execute('''
        CREATE TABLE $_tbl_name (
        $id INTEGER PRIMARY KEY,
        $quantity INTEGER NOT NULL)       
      ''');
  }

  Future<int> addtoCart(Map<String, dynamic> row) async {
    Database db = await instance.database;
    var prod = row[id];

    var samp = await db.query(_tbl_name, where: '$id =?', whereArgs: [prod]);
    if (samp.isEmpty) {
      return await db.insert(_tbl_name, row);
    } else {
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> getCartitem() async {
    Database db = await instance.database;
    return await db.query(_tbl_name);
  }

  Future updateCartitem(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int prodid = row[id];
    return await db
        .update(_tbl_name, row, where: '$id = ?', whereArgs: [prodid]);
  }

  Future<int> deleteCartItem(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String prodid = row[id];
    return await db
        .delete(_tbl_name, where: '$id = ? AND', whereArgs: [prodid]);
  }

  Future<int> getCount() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $_tbl_name');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<int> TrunccateTable() async {
    Database db = await instance.database;
    var result = await db.delete(_tbl_name);
    return result;
  }

  Future<List<CartsModel>> getcartItems() async {
    var cartlist = await getCartitem();
    int count = cartlist.length;
    List<CartsModel> noteList = List<CartsModel>();
    for (int i = 0; i < count; i++) {
      noteList.add(CartsModel.fromMapObject(cartlist[i]));
    }
    return noteList;
  }
}
