import 'package:flutter/material.dart';

import 'grocery_bloc.dart';
import 'grocery_model.dart';

class GroceryProvider extends InheritedWidget {
  Widget child;
  GroceryBloc groceryBloc;
  GroceryProvider({
    required this.child,
    required this.groceryBloc,
  }) : super(child: child);

  static GroceryProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GroceryProvider>();
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
