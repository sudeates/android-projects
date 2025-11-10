import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(223, 199, 211, 224))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          fillColor: Color.fromARGB(200, 199, 211, 224),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 104, 104, 104))
        ),
      ),
    );
  }
}

