import 'package:flutter/material.dart';
import 'package:uts_2022130039/model/cart_item.dart';
import 'package:uts_2022130039/model/produk.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product, int quantity) {
    final index = _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _cartItems[index].quantity += quantity;
    } else {
      _cartItems.add(CartItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  double totalPrice() {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

   void removeFromCart(CartItem cartItem) {
    _cartItems.remove(cartItem);
    notifyListeners();
  }
}