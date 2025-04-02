import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:ecommerce_app/models/product.dart';

class AppPreferences {
  static const String _userNameKey = 'user_name';
  static const String _isDarkModeKey = 'is_dark_mode';
  static const String _cartKey = 'cart';

  // Get an instance of SharedPreferences
  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  // Save the user's name
  Future<void> saveUserName(String name) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(_userNameKey, name);
  }

  // Get the user's name
  Future<String?> getUserName() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(_userNameKey);
  }

  // Save the dark mode preference
  Future<void> saveIsDarkMode(bool isDarkMode) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(_isDarkModeKey, isDarkMode);
  }

  // Get the dark mode preference
  Future<bool?> getIsDarkMode() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(_isDarkModeKey);
  }

  // Save the cart items
  Future<void> saveCart(List<Product> cart) async {
    final SharedPreferences prefs = await _prefs;
    final cartJson = jsonEncode(cart.map((product) => product.toJson()).toList());
    await prefs.setString(_cartKey, cartJson);
  }

  // Load the cart items
  Future<List<Product>> loadCart() async {
    final SharedPreferences prefs = await _prefs;
    final cartJson = prefs.getString(_cartKey);
    if (cartJson != null) {
      final List<dynamic> cartList = jsonDecode(cartJson);
      return cartList.map((item) => Product.fromJson(item)).toList();
    }
    return [];
  }

  // Remove a value
  Future<void> removeValue(String key) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove(key);
  }

  // Clear all values
  Future<void> clearAll() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }
}
