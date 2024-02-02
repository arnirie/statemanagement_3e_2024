import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3e/models/product.dart';
import 'package:statemanagement_3e/providers/productprovider.dart';

class ManageProductScreen extends StatefulWidget {
  ManageProductScreen({super.key, this.index});

  int? index;

  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  var codeController = TextEditingController();

  var nameController = TextEditingController();

  var priceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Products>(context, listen: false);
    if (widget.index != null) {
      var product = provider.item(widget.index!);
      codeController.text = product.productCode;
      nameController.text = product.nameDesc;
      priceController.text = product.price.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.index == null ? 'Add Product' : 'Edit Product',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Gap(12),
            TextField(
              readOnly: widget.index != null,
              controller: codeController,
              decoration: InputDecoration(
                label: const Text('Product Code'),
                border: OutlineInputBorder(),
              ),
            ),
            Gap(12),
            TextField(
              controller: nameController,
              maxLines: 3,
              decoration: InputDecoration(
                label: const Text('Name/Description'),
                border: OutlineInputBorder(),
              ),
            ),
            Gap(12),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text('Price'),
                border: OutlineInputBorder(),
              ),
            ),
            Gap(12),
            ElevatedButton(
              onPressed: () {
                var p = Product(
                  productCode: codeController.text,
                  nameDesc: nameController.text,
                  price: double.parse(priceController.text),
                  // isFavorite: true,
                );
                if (widget.index == null) {
                  provider.add(p);
                } else {
                  provider.edit(p, widget.index!);
                }
                Navigator.pop(context);
              },
              child: Text(widget.index == null ? 'ADD' : 'EDIT'),
            )
          ],
        ),
      ),
    );
  }
}
