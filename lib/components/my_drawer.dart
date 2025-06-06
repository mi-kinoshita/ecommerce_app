import 'package:ecommerce_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header: logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              //shop tile
              MyListTile(
                title: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context, "/shop_page"),
              ),

              //cart tile
              MyListTile(
                  title: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context, "/shop_page");
                    Navigator.pushNamed(context, "/cart_page");
                  }),
            ],
          ),
          // exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              title: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                "/intro_page",
                (route) => false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
