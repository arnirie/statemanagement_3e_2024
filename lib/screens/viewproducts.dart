import 'package:flutter/material.dart';
import 'package:statemanagement_3e/models/product.dart';
import 'package:statemanagement_3e/providers/productprovider.dart';
import 'package:statemanagement_3e/screens/manageproduct.dart';

class ViewProductsScreen extends StatefulWidget {
  ViewProductsScreen({super.key});

  @override
  State<ViewProductsScreen> createState() => _ViewProductsScreenState();
}

class _ViewProductsScreenState extends State<ViewProductsScreen> {
  var listProducts = Products();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View Products',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: null,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              onTap: null,
              title: Text(listProducts.items[index].nameDesc),
              subtitle: Text(listProducts.items[index].productCode),
            ),
          );
        },
        itemCount: listProducts.totalNoItems,
      ),
    );
  }
}
