import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/services/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  Future<void> _loadCart() async {
    await context.read<Shop>().loadCart();
  }

  // Calculate total price of items in the cart
  double calculateTotal(List<Product> cart) {
    return cart.fold(0, (total, current) => total + current.price);
  }

  // remove item from cart
  void removeItemFromCart(BuildContext context, Product product) async {
    // show a dialog box to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Attention"),
        content: const Text("Remove this item from your cart?"),
        actions: [
          // yes button
          MaterialButton(
            onPressed: () {
              // remove from cart
              context.read<Shop>().removeFromCart(product);
              AppPreferences().saveCart(context.read<Shop>().cart); // Save updated cart
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

  // user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Attention"),
        content: const Text("User wants to pay! Connect this app to your payment service."),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
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
                Text("Cart",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 25,
                    )),
                // subtitle
                Text("Check your cart and pay for your items",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ],
            ),
          ),
          Expanded(
            child: cart.isEmpty
                ? Center(
              child: Text("Your cart is empty..",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  )),
            )
                : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                // get individual item in cart
                final item = cart[index];

                // return as a cart tile UI
                return Column(
                  children: [
                    Card(
                      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: ListTile(
                        leading: Image.asset(item.imagePath),
                        title: Text(item.name,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            )),
                        subtitle: Text("\$${item.price.toString()}"),
                        trailing: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.close),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/product_page',
                          arguments: item,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // pay button
          cart.isEmpty
              ? const SizedBox()
              : Column(
              children: [
                // total amount
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Text(
                        "\$${calculateTotal(cart).toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Center(
                  child: MyButton(
                    onTap: () => payButtonPressed(context),
                    child: const Text("PAY NOW"),
                  ),
                ),
                // reset button
                const SizedBox(height: 10,),
                MyButton(
                  onTap: () {
                    // remove from cart
                    context.read<Shop>().clearCart();
                    AppPreferences().saveCart(context.read<Shop>().cart);
                  },
                  child: const Text("RESET"),
                ),
                SizedBox(height: 10,),
              ]
          ),
        ],
      ),
    );
  }
}
