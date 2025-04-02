import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/components/my_shop_tile.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hi, user name",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 25),
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.primary,),
                hintText: "Search",
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondaryContainer,
                border: InputBorder.none,
              )
            ),
            const SizedBox(height: 40,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Top Artist",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20)),
            ),

            //artist tiles
            SizedBox(
              height: 250,
              child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    // get each individual product
                    // final product = products[index];

                    // return as a product tile UI
                    return MyShopTile();
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
