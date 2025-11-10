import 'package:flutter/material.dart';

class SquareTitle extends StatelessWidget {
  final Function()? onTap;
  final String imagePath;
  const SquareTitle({super.key,required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Color.fromARGB(151, 199, 211, 224),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Image.asset(imagePath,height: 40,),
      ),
    );
  }
}