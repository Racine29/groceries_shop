import 'dart:math';

import 'package:flutter/material.dart';
import 'package:groceries_shop/grocery_model.dart';
import 'package:groceries_shop/grocery_provider.dart';

import 'grocery_bloc.dart';

class GroceryDetail extends StatefulWidget {
  GroceryModel grocery;
  String heroTag;

  GroceryDetail({required this.grocery, required this.heroTag});

  @override
  State<GroceryDetail> createState() => _GroceryDetailState();
}

class _GroceryDetailState extends State<GroceryDetail> {
  outlinedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Colors.grey.shade400),
    );
  }

  final countController = TextEditingController(text: "1");

  int qty = 1;
  double total = 0;
  String heroBackText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Hero(
              tag: widget.heroTag,
              child: Center(
                child: Image.asset(
                  widget.grocery.img,
                  height: 220,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "${widget.grocery.name}",
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "${widget.grocery.weight}g",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black45,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    // enabled: false,
                    textAlign: TextAlign.center,
                    controller: countController,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {
                            qty++;

                            setState(() {
                              countController.value =
                                  TextEditingValue(text: qty.toString());
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                          )),
                      prefixIcon: InkWell(
                          onTap: () {
                            if (qty == 1) {
                              return;
                            }
                            qty--;
                            setState(() {
                              countController.value =
                                  TextEditingValue(text: qty.toString());
                            });
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          )),
                      contentPadding: const EdgeInsets.all(0),
                      border: outlinedBorder(),
                      enabledBorder: outlinedBorder(),
                      errorBorder: outlinedBorder(),
                      focusedBorder: outlinedBorder(),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                Text(
                  "\$${(widget.grocery.price * qty).toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "About the product",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              widget.grocery.desc,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black45,
                fontWeight: FontWeight.normal,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(.9),
              spreadRadius: 40,
              blurRadius: 30,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 70,
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200),
                        )),
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.grey,
                      size: 30,
                    )),
              ),
              const SizedBox(
                width: 40,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final groceryInstance = GroceryBloc.singleton;
                    widget.heroTag = "cart${widget.grocery.id}";

                    final index = groceryInstance.isExist(widget.grocery);

                    if (index == -1) {
                      widget.grocery.qty = qty;
                      widget.grocery.price = widget.grocery.price;
                      groceryInstance.add(widget.grocery);
                    } else {
                      groceryInstance.update(index, qty);
                    }

                    setState(() {});
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    elevation: 0,
                    backgroundColor: Colors.amber.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
