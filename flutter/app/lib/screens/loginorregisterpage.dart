import 'package:app/screens/login_page.dart';
import 'package:app/screens/registerpage.dart';
import 'package:flutter/material.dart';

class Loginorregisterpage extends StatefulWidget {
  const Loginorregisterpage({super.key});

  @override
  State<Loginorregisterpage> createState() => _LoginorregisterpageState();
}

class _LoginorregisterpageState extends State<Loginorregisterpage> {
  bool showLoginPage = true;
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}