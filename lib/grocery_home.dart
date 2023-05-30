import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:groceries_shop/grocery_model.dart';
import 'package:groceries_shop/grocery_bloc.dart';

import 'delivery_section.dart';
import 'grocery_app_bar.dart';
import 'grocery_cart_list.dart';
import 'grocery_mini_cart_list.dart';
import 'grocery_list.dart';
import 'grocery_provider.dart';

class GroceryHome extends StatefulWidget {
  GroceryHome();

  @override
  State<GroceryHome> createState() => _GroceryHomeState();
}

class _GroceryHomeState extends State<GroceryHome>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  int qtyTotal = 0;
  double position = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemBlocTopPosition = size.height * 0;
    final itemBlocHeight = size.height * .85;
    final groceryProvider = GroceryProvider.of(context)?.groceryBloc;

    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            final value =
                Curves.easeInOut.transform(_animationController.value);

            return Stack(
              children: [
                // bottom cart bloc ----------
                AnimatedBuilder(
                    animation: GroceryBloc.singleton,
                    builder: (context, _) {
                      return Positioned(
                        bottom: lerpDouble(-size.height * .7, 0, value),
                        left: 0,
                        right: 0,
                        height: size.height * .9,
                        child: GestureDetector(
                            onVerticalDragUpdate: (details) {
                              final pointer = details.delta.dy;

                              if (pointer < -6) {
                                position = -6;
                                _animationController.forward();
                              }
                              if (position == -6 && pointer > 6) {
                                _animationController.reverse();
                              }
                            },
                            child: Container(
                              color: Colors.black,
                              alignment: Alignment.topCenter,
                              height: size.height,
                              width: size.width,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: value > .3 ? 50 : 60,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (value < 0.5) ...{
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "Cart",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                if (groceryProvider!
                                                    .groceries.isNotEmpty)
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: 50,
                                                      child:
                                                          GroceryMiniCartList(),
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.amber.shade400,
                                            child: FittedBox(
                                              child: Text(
                                                groceryProvider.qtyTotal
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    } else ...{
                                      const Text(
                                        "Cart",
                                        style: TextStyle(
                                            fontSize: 26, color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                        child:
                                            groceryProvider!.groceries.isEmpty
                                                ? Container()
                                                : GroceryCartList(),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const DeliverySection(),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total:",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 24,
                                            ),
                                          ),
                                          Text(
                                            "\$${groceryProvider.totalPrice.toStringAsFixed(2)}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(14),
                                          elevation: 0,
                                          backgroundColor:
                                              Colors.amber.shade400,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                          ),
                                        ),
                                        child: const Text(
                                          "Next",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    }
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),

                // item bloc size -----------
                Positioned(
                  top:
                      lerpDouble(itemBlocTopPosition, -size.height * .7, value),
                  left: 0,
                  right: 0,
                  height: itemBlocHeight,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: GroceryList(groceries: products),
                  ),
                ),
                // App bar --------------------------------
                GroceryAppBar(
                  top: value > .1 ? -size.height * .3 : 0,
                ),
              ],
            );
          }),
    );
  }
}
