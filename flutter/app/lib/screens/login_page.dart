import 'package:app/compenents/mytextfield.dart';
import 'package:app/compenents/signbutton.dart';
import 'package:app/compenents/square_title.dart';
import 'package:app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    // Show a loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context); // Close the loading dialog if login is successful
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close the loading dialog first
      showErrorSnackBar(e.code);
    }
  }

  void showErrorSnackBar(String errorCode) {
    String errorMessage;
    switch (errorCode) {
      case 'user-not-found':
        errorMessage = 'Wrong email';
        break;
      case 'wrong-password':
        errorMessage = 'Wrong password';
        break;
      default:
        errorMessage = 'An unexpected error occurred';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "lib/assets/images/loginpage_background.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        color: Color.fromARGB(255, 77, 77, 77),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Sign in to discover travel tips, plan your next trip, and explore new adventures. New here? Create an account and start your journey with us!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 77, 77, 77),
                        fontSize: 15,
                        backgroundColor: Color.fromARGB(136, 199, 211, 224),
                      ),
                    ),
                  ),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyButton(
                    onTap: signUserIn,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTitle(
                        onTap: () => AuthService().signInWithGoogle(),
                        imagePath: "lib/assets/images/google.png"),
                      SizedBox(
                        width: 10,
                      ),
                      SquareTitle(
                        onTap: (){

                        },
                        imagePath: "lib/assets/images/apple.png"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member?',
                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
