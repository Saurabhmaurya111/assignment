import 'package:flutter/material.dart';


class CartProvider with ChangeNotifier {
  final Map<String, int> _cartItems = {};

  Map<String, int> get cartItems => _cartItems;

  void addItem(String title) {
    if (_cartItems.containsKey(title)) {
      _cartItems[title] = _cartItems[title]! + 1;
    } else {
      _cartItems[title] = 1;
    }
    notifyListeners();
  }

  void removeItem(String title) {
    if (_cartItems.containsKey(title) && _cartItems[title]! > 1) {
      _cartItems[title] = _cartItems[title]! - 1;
    } else {
      _cartItems.remove(title);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  int getQuantity(String title) {
    return _cartItems[title] ?? 0;
  }
}
