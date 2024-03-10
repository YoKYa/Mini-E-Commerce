// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/components/my_drawer.dart';
import 'package:mini_ecommerce/components/my_product_tile.dart';
import 'package:mini_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    // Access Product
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shop Page'),
          actions: [
            // Go To cart Button
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.shopping_cart))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.grey[800],
        ),
        drawer: const MyDrawer(),
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            //Shop Subtitle
            Center(
                child: Text(
              "Premium Product",
              style: TextStyle(color: Colors.grey[600]),
            )),
            //Product List
            SizedBox(
              height: 550,
              child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    // Get Individual
                    final product = products[index];
                    return MyProductTile(product: product);
                  }),
            )
          ],
        ));
  }
}
