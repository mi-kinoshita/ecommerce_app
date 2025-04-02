import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/intro_page.dart';
import 'package:ecommerce_app/pages/login_page.dart';
import 'package:ecommerce_app/pages/product_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:ecommerce_app/pages/top_page.dart';
import 'package:ecommerce_app/services/user_firestore_service.dart';
import 'package:ecommerce_app/theme.dart';
import 'package:ecommerce_app/util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (context) => Shop(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    TextTheme textTheme =
        createTextTheme(context, "Merriweather", "Merriweather");
    final theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'ecommerce app',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        "/intro_page": (context) => const IntroPage(),
        "/top_page": (context) => const TopPage(),
        "/shop_page": (context) => const ShopPage(),
        "/cart_page": (context) => const CartPage(),
        "/product_page": (context) => const ProductPage(),
        "/login_page": (context) => const LoginPage(),
      },
    );
  }
}
