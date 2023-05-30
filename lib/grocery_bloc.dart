import 'package:flutter/material.dart';
import 'package:groceries_shop/grocery_model.dart';

class GroceryBloc extends ChangeNotifier {
  List<GroceryModel> groceries = [];
  int qtyTotal = 0;
  double totalPrice = 0;

  GroceryBloc._privateConstructor();

  static final GroceryBloc singleton = GroceryBloc._privateConstructor();

  add(GroceryModel grocery) {
    groceries.add(grocery);
    qtyTotal = 0;
    totalQtySum();
    notifyListeners();
  }

  int isExist(GroceryModel grocery) {
    return groceries.indexWhere((e) => e.id == grocery.id);
  }

  totalQtySum() {
    groceries.forEach((e) {
      qtyTotal = qtyTotal + e.qty!;
      totalPrice = totalPrice + (e.qty! * e.price);
    });
  }

  update(int index, int qty) {
    qtyTotal = 0;
    groceries[index].qty = groceries[index].qty! + qty;
    totalQtySum();
    notifyListeners();
  }
}
