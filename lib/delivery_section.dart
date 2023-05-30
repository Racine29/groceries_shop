import 'package:flutter/material.dart';

class DeliverySection extends StatelessWidget {
  const DeliverySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 20,
            backgroundColor: Colors.amber.withOpacity(.3),
            child: FittedBox(
                child: Icon(
              Icons.delivery_dining,
              color: Colors.amber,
            )),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Delivery",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SizedBox(
                    child: Text(
                      "All orders of \$40 or more qualify for FREE delivery",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "\$30.0",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
