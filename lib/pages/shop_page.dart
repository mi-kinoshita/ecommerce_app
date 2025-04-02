import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/components/my_product_tile.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;
    final int cartItemCount = context.watch<Shop>().cart.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        centerTitle: true,
        actions: [
          badges.Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            badgeContent: Text(
              "$cartItemCount",
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart_page"),
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // shop title
                      Text("Shop Name",
                          style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 25)),

                      // subtitle
                      Text("Pick from a selected list of premium products",
                          style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary)),
                    ],
                  ),
                ),

                //product tiles
                SizedBox(
                  height: 550,
                  child: ListView.builder(
                      itemCount: products.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(15),
                      itemBuilder: (context, index) {
                        // get each individual product
                        final product = products[index];

                        // return as a product tile UI
                        return MyProductTile(product: product);
                      }),
                ),
                const SizedBox(height: 10,),
                // shop title
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Recommend",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 25)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
