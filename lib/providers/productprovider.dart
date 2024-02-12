import 'package:flutter/material.dart';
import 'package:statemanagement_3e/helpers/dbhelper.dart';
import 'package:statemanagement_3e/models/product.dart';

class Products extends ChangeNotifier {
  List<Product> _items = [];

  //from db
  Future<List<Product>> get items async {
    //convert List<Map<String, dynamic> -> List<Product> Product.fromMap
    var list = await DbHelper.fetchProducts();
    print('map length: ${list.length}');
    // list.forEach((element) => print(element));
    var converted = list.map((item) => Product.fromMap(item)).toList();
    // converted.forEach((element) => print(element));
    return converted;
  }

  int get totalNoItems => _items.length;

  Product item(int index) => _items[index];

  void add(Product p) {
    DbHelper.insertProduct(p);
    notifyListeners();
  }

  void edit(Product p, int index) {
    _items[index] = p;
    notifyListeners();
  }

  void toggleFavorite(int index) {
    _items[index].isFavorite = !_items[index].isFavorite;
    notifyListeners();
  }
}
