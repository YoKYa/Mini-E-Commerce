import 'package:flutter/material.dart';
import 'package:mini_ecommerce/models/product.dart';
import 'package:mini_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({
    super.key,
    required this.product,
  });

  void addToCart(BuildContext context) {
    // show dialog
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("Add this item to your cart?"),
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
                    context.read<Shop>().addToCart(product);
                  },
                  child: const Text("Yes"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey[50], borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(25),
                    width: double.infinity,
                    child: Image.asset(product.imagePath)),
              ),
              const SizedBox(
                height: 25,
              ),
              // Product Name
              Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              // Product description
              Text(
                product.description,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          // Product price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Rp.",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Text(product.price.toStringAsFixed(2)),
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: const Icon(Icons.add))),
            ],
          ),
          // add to chart
        ],
      ),
    );
  }
}
