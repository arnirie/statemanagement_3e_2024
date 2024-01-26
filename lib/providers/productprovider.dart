import 'package:flutter/material.dart';
import 'package:statemanagement_3e/models/product.dart';

class Products extends ChangeNotifier {
  List<Product> _items = [
    Product(productCode: '123', nameDesc: 'Sample', price: 1200),
  ];

  List<Product> get items {
    return _items;
  }

  int get totalNoItems {
    return _items.length;
  }

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }
}
