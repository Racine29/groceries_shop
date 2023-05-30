import 'package:flutter/material.dart';

import 'grocery_provider.dart';

class GroceryMiniCartList extends StatelessWidget {
  GroceryMiniCartList();

  @override
  Widget build(BuildContext context) {
    final groceryProvider = GroceryProvider.of(context)?.groceryBloc;

    return ListView.builder(
        itemCount: groceryProvider!.groceries.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          final item = groceryProvider.groceries[index];

          return Row(
            children: [
              Hero(
                tag: "cart${item.id}",
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(item.img),
                    ),
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        maxRadius: 8,
                        backgroundColor: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: FittedBox(
                            child: Text(
                              "${item.qty}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          );
        });
  }
}
