import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_se/Home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

// Email controller
final TextEditingController emailController = TextEditingController();
String email = emailController.text;
// Password controller
final TextEditingController passwordController = TextEditingController();
String password = passwordController.text;
// confirm password controller
final TextEditingController confirmPasswordController = TextEditingController();
String confirmPassword = confirmPasswordController.text;

class _SignUpState extends State<SignUp> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const Image(
            image: AssetImage('assets/1.png'),
          ),
          // Create a Email TextFormField
          SizedBox(
            width: 360,
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                hintText: 'Enter your email',
                labelText: 'Email',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Create a Password TextFormField
          SizedBox(
            width: 360,
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                hintText: 'Enter your password',
                labelText: 'Password',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Create a Confirm Password TextFormField
          SizedBox(
            width: 360,
            child: TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                hintText: 'Confirm your password',
                labelText: 'Confirm Password',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Signup Button
          SizedBox(
            width: 360,
            child: FloatingActionButton(
              onPressed: () {
                // print(email);
                // print(password);
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email, password: password)
                    .then((value) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error'),
                    ),
                  );
                });
              },
              child: const Text('Sign Up'),
            ),
          ),
        ],
      ),
    ));
  }
}