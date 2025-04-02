import 'package:badges/badges.dart';
import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  void addToCart(BuildContext context) {
    // show a dialog box to ask user to confirm adding to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Attention"),
        content: const Text("Add this item to your cart?"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the product passed through Navigator
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    final int cartItemCount = context.watch<Shop>().cart.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          badges.Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            badgeContent: Text(
              "$cartItemCount",
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart_page"),
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    product.imagePath,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: Icon(Icons.more_horiz),
                          onSelected: (String value) {
                            // メニューの選択に応じた処理
                            if (value == 'saved') {
                              // Savedが選択されたときの処理
                              addToCart(context);
                            } else if (value == 'share') {
                              // Shareが選択されたときの処理
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'saved',
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.bookmark_border), // アイコン
                                  SizedBox(width: 8), // アイコンとテキストの間にスペースを追加
                                  Text('Bookmark'), // テキスト
                                ],
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: 'share',
                              child: Row(
                            children: <Widget>[
                            Icon(Icons.share), // アイコン
                                SizedBox(width: 8), // アイコンとテキストの間にスペースを追加
                                Text('Share'), // テキスト
                              ],
                        ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    // more information space
                    const SizedBox(height: 20),
                    MyButton(
                      onTap: () {
                        context.read<Shop>().addToCart(product);
                      },
                      child: const Text(
                        "Add this item to your cart",
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
