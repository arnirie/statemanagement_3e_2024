import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:statemanagement_3e/models/product.dart';

class DbHelper {
  //constants
  static const dbName = 'products.db';
  static const dbVersion = 3;
  //product table
  static const tbProduct = 'product';
  static const prodCode = 'code';
  static const prodName = 'nameDesc';
  static const prodPrice = 'price';

  static Future<Database> openDb() async {
    var path = join(await getDatabasesPath(), dbName);
    var sql =
        'CREATE TABLE IF NOT EXISTS $tbProduct ($prodCode TEXT PRIMARY KEY, $prodName TEXT NOT NULL, $prodPrice DECIMAL(10,2))';
    var db = await openDatabase(
      path,
      version: dbVersion,
      onCreate: (db, version) {
        db.execute(sql);
        print('$tbProduct was created');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < newVersion) {
          db.execute('DROP TABLE IF EXISTS $tbProduct');
          db.execute(sql);
          print('$tbProduct recreated');
        }
      },
    );
    return db;
  }

  static Future<void> insertProduct(Product product) async {
    //open db
    final db = await openDb();
    //insert record
    // await db.rawInsert(
    //     'INSERT INTO $tbProduct($prodCode, $prodName, $prodPrice) VALUES(\'${product.productCode}\', \'${product.nameDesc}\',${product.price});');
    print('record inserted');
    await db.insert(tbProduct, product.toMap());
  }

  static Future<List<Map<String, dynamic>>> fetchProducts() async {
    final db = await openDb();
    // return await db.rawQuery('SELECT * FROM $tbProduct');
    return db.query(tbProduct);
  }
}
