import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/services/app_preferences.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    // product 1
    Product(
        name: "Product 1",
        price: 99.99,
        description: "Item description.. more description to describe the product more info here will look like this",
        imagePath: "assets/embellishedattire.jpeg"
    ),
    // product 2
    Product(
        name: "Product 2",
        price: 99.99,
        description: "Item description..",
        imagePath: "assets/elegantportrait.jpeg"
    ),
    // product 3
    Product(
        name: "Product 3",
        price: 99.99,
        description: "Item description..",
        imagePath: "assets/insilveroutfit.jpeg"
    ),
    // product 4
    Product(
        name: "Product 4",
        price: 99.99,
        description: "Item description..",
        imagePath: "assets/ornateearring.jpeg"
    ),
    // product 5
    Product(
        name: "Product 5",
        price: 99.99,
        description: "Item description..",
        imagePath: "assets/sereneportrait.jpeg"
    ),
  ];

  //user cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  Shop() {
    loadCart();
  }

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    saveCart();
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    saveCart();
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    saveCart();
    notifyListeners();
  }

  Future<void> loadCart() async {
    final loadedCart = await AppPreferences().loadCart();
    _cart = loadedCart;
    notifyListeners();
  }

  Future<void> saveCart() async {
    await AppPreferences().saveCart(_cart);
  }

  }
