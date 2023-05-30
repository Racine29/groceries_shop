import 'package:flutter/material.dart';

import 'grocery_provider.dart';

class GroceryCartList extends StatelessWidget {
  const GroceryCartList({super.key});

  @override
  Widget build(BuildContext context) {
    final groceryProvider = GroceryProvider.of(context)?.groceryBloc;

    return ListView.builder(
      itemCount: groceryProvider!.groceries.length,
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        final item = groceryProvider.groceries[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(item.img),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    item.qty.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "x",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    item.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text(
                "\$${item.price}",
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        );
      },
    );
  }
}
