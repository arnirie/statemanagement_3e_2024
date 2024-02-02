import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3e/models/cartiitem.dart';
import 'package:statemanagement_3e/models/product.dart';
import 'package:statemanagement_3e/providers/cartprovider.dart';
import 'package:statemanagement_3e/providers/productprovider.dart';
import 'package:statemanagement_3e/screens/manageproduct.dart';
import 'package:statemanagement_3e/screens/viewcart.dart';

class ViewProductsScreen extends StatelessWidget {
  void openAddScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProductScreen(),
      ),
    );
  }

  void openEditScreen(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProductScreen(
          index: index,
        ),
      ),
    );
  }

  void changeFavorite(BuildContext context, int index) {
    //toggleFavorite
    Provider.of<Products>(context, listen: false).toggleFavorite(index);
  }

  void addToCart(BuildContext context, String productCode) {
    Provider.of<CartItems>(context, listen: false).add(CartItem(
      productCode: productCode,
    ));
  }

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
            onPressed: () => openAddScreen(context),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Consumer<Products>(
        builder: (_, products, child) {
          return ListView.builder(
            itemBuilder: (_, index) {
              print(index);
              return Card(
                child: ListTile(
                  onTap: () => openEditScreen(context, index),
                  leading: IconButton(
                    onPressed: () => changeFavorite(context, index),
                    icon: Icon(products.items[index].isFavorite
                        ? Icons.favorite
                        : Icons.favorite_outline),
                  ),
                  trailing: IconButton(
                    onPressed: () =>
                        addToCart(context, products.items[index].productCode),
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                  title: Text(products.items[index].nameDesc),
                  subtitle: Text(products.items[index].productCode),
                ),
              );
            },
            itemCount: products.totalNoItems,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ViewCartScreen(),
        )),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
