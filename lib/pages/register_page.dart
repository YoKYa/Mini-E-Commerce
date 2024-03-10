// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/components/my_button.dart';
import 'package:mini_ecommerce/components/my_textfield.dart';
import 'package:mini_ecommerce/components/tile_button.dart';
import 'package:mini_ecommerce/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // controller

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  // Sign up
  void signUserUp() async {
    // Loading
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    // Creating User
    try {
      if (passwordController.text == passwordConfirmController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.replaceAll(" ", ""),
            password: passwordController.text);
      } else {
        wrongMessage();
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        Navigator.pop(context);
        wrongMessage();
      }
    }
  }

  void wrongMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect email or password'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),

                // Logo
                const Icon(
                  Icons.shopping_bag,
                  size: 100,
                ),
                Text(
                  'Mini E-Commerce',
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                // Welcome Back
                Text(
                  'REGISTER',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 15,
                ),
                // email
                MyTextField(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                // Password
                MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true),
                const SizedBox(
                  height: 10,
                ),
                // ConfirmPassword
                MyTextField(
                    controller: passwordConfirmController,
                    hintText: "Confirm Password ",
                    obscureText: true),
                const SizedBox(
                  height: 25,
                ),
                // Sign Up
                MyButton(
                  text: "REGISTER",
                  onTap: signUserUp,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Continue With
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('Or continue with',
                            style: TextStyle(color: Colors.grey[700])),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Google
                TileButton(
                  imagePath: 'lib/images/google.png',
                  onTap: () => AuthService().signInWithGoogle(),
                ),
                const SizedBox(
                  height: 20,
                ),

                //  Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Login now',
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
