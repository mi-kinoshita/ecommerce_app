import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/services/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  // add to cart button pressed
  void addToCart(BuildContext context) async {
    // show a dialog box to ask user to confirm adding to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Attention"),
        content: const Text("Add this item to your cart?"),
        actions: [
          // yes button
          MaterialButton(
            onPressed: () async {
              // add to cart
              context.read<Shop>().addToCart(product);
              // save cart to shared preferences
              await AppPreferences().saveCart(context.read<Shop>().cart);
              // close dialog box
              Navigator.pop(context);
            },
            child: const Text("Yes"),
          ),
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/product_page',
        arguments: product,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12),
          boxShadow: null,
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(25),
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // image
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    width: double.infinity,
                    padding: const EdgeInsets.all(2),
                    child: Image.asset(product.imagePath),
                  ),
                ),
                const SizedBox(height: 10),
                // name
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                // description
                Text(
                  product.description,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${product.price.toStringAsFixed(2)}"),
                // add to cart button
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () async {
                        // add to cart
                        context.read<Shop>().addToCart(product);
                        // save cart to shared preferences
                        await AppPreferences().saveCart(context.read<Shop>().cart);
                      },
                    // => addToCart(context),
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
