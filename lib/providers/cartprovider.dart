import 'package:flutter/material.dart';
import 'package:statemanagement_3e/providers/productprovider.dart';

class CartItems extends ChangeNotifier {
  List<Products> _cartItems = [];
}
