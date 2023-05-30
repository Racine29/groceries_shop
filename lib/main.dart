import "package:flutter/material.dart";
import "package:groceries_shop/grocery_provider.dart";

import 'grocery_bloc.dart';
import "grocery_home.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GroceryProvider(
          groceryBloc: GroceryBloc.singleton, child: GroceryHome()),
    );
  }
}
