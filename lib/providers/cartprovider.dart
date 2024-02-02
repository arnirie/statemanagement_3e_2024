import 'package:flutter/material.dart';
import 'package:statemanagement_3e/models/cartiitem.dart';

class CartItems extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalNoItems => _items.length;

  void add(CartItem cartItem) {
    //check first cartItem(productcode) is present in the list
    // int index = 0;
    // bool isFound = false;
    // for (; index < _items.length; index++) {
    //   if (_items[index].productCode == cartItem.productCode) {
    //     isFound = true;
    //     break;
    //   }
    // }

    //List<CartItem> productCode, quantity
    var codeList = _items.map((item) => item.productCode).toList();
    var index = codeList.indexOf(cartItem.productCode);

    if (index < 0) {
      //add
      _items.add(cartItem);
    } else {
      //increment
      _items[index].quantity++;
    }

    notifyListeners();
  }
}
