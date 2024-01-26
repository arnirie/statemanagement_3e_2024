import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:statemanagement_3e/models/product.dart';

class ManageProductScreen extends StatefulWidget {
  ManageProductScreen(
      {super.key, this.add, this.edit, this.product, this.index});

  final Function(Product p)? add;
  final Function(Product p, int index)? edit;
  Product? product;
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
    if (widget.product != null) {
      //font ligature >= != <=
      codeController.text = widget.product!.productCode;
      nameController.text = widget.product!.nameDesc;
      priceController.text = widget.product!.price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product == null ? 'Add Product' : 'Edit Product',
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
              readOnly: widget.product != null,
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
                );
                if (widget.product == null) {
                  widget.add!(p);
                } else {
                  widget.edit!(p, widget.index!);
                }

                Navigator.pop(context);
              },
              child: Text(widget.product == null ? 'ADD' : 'EDIT'),
            )
          ],
        ),
      ),
    );
  }
}
