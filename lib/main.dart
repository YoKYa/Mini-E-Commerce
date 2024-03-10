import 'package:flutter/material.dart';
import 'package:mini_ecommerce/models/shop.dart';
import 'package:mini_ecommerce/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini_ecommerce/pages/cart_page.dart';
import 'package:mini_ecommerce/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        '/home_page': (context) => HomePage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
