import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  // add to cart button pressed
  void addToCart(BuildContext context) {
    // show a dialog box to ask user to confirm adding to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Add this item to your cart?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              // add to cart
              context.read<Shop>().addToCart(product);
              // close dialog box
              Navigator.pop(context);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //image
              // Image(image: AssetImage(product.imagePath)),
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12)),
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    child: Image.asset(product.imagePath)),
              ),
              const SizedBox(
                height: 10,
              ),
              //name
              Text(
                product.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(
                height: 10,
              ),
              //description
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${product.price.toStringAsFixed(2)}",
              ),
              //add to cart button
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: const Icon(Icons.add)),
              )
            ],
          )
        ],
      ),
    );
  }
}
