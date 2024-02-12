import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3e/helpers/dbhelper.dart';
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

  Future<void> sampleFetch() async {
    var list = await DbHelper.fetchProducts();
    list.forEach((element) {
      print(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    // sampleFetch();
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
            // onPressed: () {
            //   DbHelper.insertProduct(Product(
            //     productCode: '123',
            //     nameDesc: 'iPhone',
            //     price: 100,
            //   ));
            // },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Consumer<Products>(
        builder: (_, products, child) {
          return FutureBuilder(
            future: products.items,
            builder: (context, snapshot) {
              //check if the data is not yet ready
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              //check if the data is ready but not records
              if (snapshot.data == null) {
                print(snapshot.connectionState);
                return Center(
                  child: Text('No records found'),
                );
              }
              //data is ready
              var prodList = snapshot.data!;
              return ListView.builder(
                itemBuilder: (_, index) {
                  print(index);
                  return Card(
                    child: ListTile(
                      onTap: () => openEditScreen(context, index),
                      leading: IconButton(
                        onPressed: () => changeFavorite(context, index),
                        icon: Icon(prodList[index].isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline),
                      ),
                      trailing: IconButton(
                        onPressed: () =>
                            addToCart(context, prodList[index].productCode),
                        icon: Icon(Icons.shopping_cart_outlined),
                      ),
                      title: Text(prodList[index].nameDesc),
                      subtitle: Text(prodList[index].productCode),
                    ),
                  );
                },
                itemCount: prodList.length,
              );
            },
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
