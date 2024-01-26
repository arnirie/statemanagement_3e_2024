import 'package:flutter/material.dart';
import 'package:statemanagement_3e/providers/productprovider.dart';
import 'package:statemanagement_3e/screens/viewproducts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Activity1App());
}

class Activity1App extends StatelessWidget {
  const Activity1App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ViewProductsScreen(),
      ),
    );
  }
}
