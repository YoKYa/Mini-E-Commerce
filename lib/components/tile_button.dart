import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const TileButton({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: Image.asset(
            imagePath,
            height: 40,
          )),
        ));
  }
}
