import 'package:flutter/material.dart';
import 'package:mini_ecommerce/models/product.dart';

class Shop extends ChangeNotifier {
  // Product Of Sale
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 10000,
      description: "Item Description 1",
      imagePath: 'lib/images/google.png',
    ),
    Product(
      name: "Product 2",
      price: 10000,
      description: "Item Description 2",
      imagePath: 'lib/images/google.png',
    ),
    Product(
      name: "Product 3",
      price: 10000,
      description: "Item Description 3",
      imagePath: 'lib/images/google.png',
    ),
    Product(
      name: "Product 4",
      price: 10000,
      description: "Item Description 4",
      imagePath: 'lib/images/google.png',
    ),
  ];
  // User Cart
  final List<Product> _cart = [];
  // Get Product List
  List<Product> get shop => _shop;
  // Get User Cart
  List<Product> get cart => _cart;

  // add item to the cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // Remove item from the cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
