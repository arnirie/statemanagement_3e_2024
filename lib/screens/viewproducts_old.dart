import 'package:flutter/material.dart';
import 'package:statemanagement_3e/models/product.dart';
import 'package:statemanagement_3e/screens/manageproduct.dart';

class ViewProductsScreen extends StatefulWidget {
  ViewProductsScreen({super.key});

  @override
  State<ViewProductsScreen> createState() => _ViewProductsScreenState();
}

class _ViewProductsScreenState extends State<ViewProductsScreen> {
  List<Product> listProducts = [
    Product(
      productCode: 'AB123',
      nameDesc: 'iPhone',
      price: 50000,
    )
  ];

  void addProduct(Product p) {
    setState(() {
      listProducts.add(p);
    });
  }

  void editProduct(Product p, int index) {
    setState(() {
      listProducts[index].nameDesc = p.nameDesc;
      listProducts[index].price = p.price;
    });
  }

  void openAddScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ManageProductScreen(
            // add: addProduct,
            ),
      ),
    );
  }

  void openEditScreen(Product p, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProductScreen(
          // edit: editProduct,
          // product: p,
          index: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // listProducts[0].nameDesc = 'iPAD';
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
            onPressed: openAddScreen,
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
              onTap: () {
                openEditScreen(listProducts[index], index);
              },
              title: Text(listProducts[index].nameDesc),
              subtitle: Text(listProducts[index].productCode),
            ),
          );
        },
        itemCount: listProducts.length,
      ),
    );
  }
}
