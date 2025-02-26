import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/intro_page.dart';
import 'package:ecommerce_app/pages/product_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:ecommerce_app/theme.dart';
import 'package:ecommerce_app/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Merriweather", "Merriweather");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'ecommerce app',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        "/intro_page": (context) => const IntroPage(),
        "/shop_page": (context) => const ShopPage(),
        "/cart_page": (context) => const CartPage(),
        "/product_page": (context) => const ProductPage(),
      },
    );
  }
}
