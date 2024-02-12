import 'package:statemanagement_3e/helpers/dbhelper.dart';

class Product {
  late String productCode;
  late String nameDesc;
  late double price;
  late bool isFavorite;

  //constructor
  Product({
    required this.productCode,
    required this.nameDesc,
    required this.price,
    this.isFavorite = false,
  });

  Product.fromMap(Map<String, dynamic> values) {
    print(values);
    productCode = values[DbHelper.prodCode].toString();
    nameDesc = values[DbHelper.prodName].toString();
    price = double.parse(values[DbHelper.prodPrice].toString());
    isFavorite = false;
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.prodCode: productCode,
      DbHelper.prodName: nameDesc,
      DbHelper.prodPrice: price,
    };
  }
}
