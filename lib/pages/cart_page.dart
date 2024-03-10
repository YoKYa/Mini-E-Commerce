import 'package:flutter/material.dart';
import 'package:mini_ecommerce/components/my_button.dart';
import 'package:mini_ecommerce/models/product.dart';
import 'package:mini_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("remove this item to your cart?"),
              actions: [
                // Cancel
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                // Yes
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: const Text("Yes"),
                ),
              ],
            ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text("User Want To Pay, connect this app to your payment"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // Cart List
          Expanded(
              child: cart.isEmpty
                  ? const Center(child: Text("Your cart is empty!"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        // Get Individual item
                        final item = cart[index];
                        // Return as ListTile
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                              onPressed: () => removeItemFromCart(context, item),
                              icon: const Icon(Icons.remove)),
                        );
                      })),
          // Pay Button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap: () => payButtonPressed(context), text: "PAY NOW"),
          ),
        ],
      ),
    );
  }
}
