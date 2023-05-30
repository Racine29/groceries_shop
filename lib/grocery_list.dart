import 'package:flutter/material.dart';
import 'package:groceries_shop/grocery_bloc.dart';
import 'package:groceries_shop/grocery_detail.dart';
import 'package:groceries_shop/grocery_model.dart';

class GroceryList extends StatelessWidget {
  List<GroceryModel> groceries;

  GroceryList({
    required this.groceries,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 241, 241, 227),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: GridView.builder(
        itemCount: groceries.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          mainAxisExtent: 220,
        ),
        padding: EdgeInsets.only(
            top: size.height * .18, left: 10, right: 10, bottom: 80),
        itemBuilder: (_, index) {
          final grocery = groceries[index];
          return Transform.translate(
            offset: Offset(0, index.isOdd ? 40 : 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                color: Colors.white.withOpacity(.3),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 600),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 600),
                        pageBuilder: (ctx, anim, _) {
                          return FadeTransition(
                            opacity: anim,
                            child: GroceryDetail(
                              grocery: grocery,
                              heroTag: index.toString(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Hero(
                          tag: index.toString(),
                          child: Center(
                            child: Image.asset(
                              grocery.img,
                              height: 100,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$${grocery.price}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${grocery.name}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${grocery.weight}g",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
