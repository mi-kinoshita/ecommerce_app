import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart
  void removeItemFromCart(BuildContext context, Product product) {
    // show a dialog box to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              // remove from cart
              context.read<Shop>().removeFromCart(product);
              // close dialog box
              Navigator.pop(context);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  // user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: const Text("User wants to pay! Connect this app to your payment service"),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // shop title
                Text(
                  "Cart",
                  style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),

                // subtitle
                Text(
                  "Check your cart and pay for your items",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ],
            ),
          ),
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Your cart is empty.."))
                : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                // get indivisual item in cart
                final item = cart[index];

                // return as a cart tile UI
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
              },
            ),
          ),

          // pay button
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: MyButton(onTap: ()=>payButtonPressed(context),
                  child: const Text("PAY NOW")
              ),
            ),
          )
        ],
      ),
    );
  }
}
