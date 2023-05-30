import 'package:flutter/material.dart';

class GroceryAppBar extends StatelessWidget {
  double? top;
  GroceryAppBar({this.top = 0});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: 0,
      right: 0,
      top: top,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        color: Color.fromARGB(255, 241, 241, 227),
        padding: MediaQuery.of(context).padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                BackButton(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Pasta & Noodles",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.filter_list_sharp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
