import 'package:sqflite/sqflite.dart';

class DbHelper {
  //constants
  static const dbName = 'products.db';
  static const dbVersion = 1;
  //product table
  static const tbProduct = 'product';
  static const prodCode = 'code';
  static const prodName = 'nameDesc';
  static const prodPrice = 'price';

  void openDb() {
    // getDatabasesPath()
    // openDatabase(path);
  }
}
