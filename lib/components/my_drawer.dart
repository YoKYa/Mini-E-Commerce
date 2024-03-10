import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_ecommerce/components/list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  // Logout
  void logUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Header
              const DrawerHeader(
                  child: Center(
                      child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Colors.black,
              ))),
              const SizedBox(
                height: 25,
              ),
              // Shop Tile
              MyListTile(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context)),

              // Cart Tile
              MyListTile(
                  text: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  }),

              // Logout
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
                text: "Logout", icon: Icons.logout, onTap: logUserOut),
          )
        ],
      ),
    );
  }
}
