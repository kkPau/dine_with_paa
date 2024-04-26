import 'package:dine_with_paa/model/cartmodel.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<CartModel> _cart = [];

  List<CartModel> get cart => _cart;

  double total = 0;

  void addToCart(CartModel item, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(item);
    }

    notifyListeners();
  }

  void removeFromCart(CartModel item) {
    _cart.remove(item);

    notifyListeners();
  }
}
