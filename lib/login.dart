import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_se/Home.dart';
import 'package:travel_app_se/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Email controller
  final TextEditingController emailController = TextEditingController();
// Password controller
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
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
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 2.0),
                  ),
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Toggle the password visibility
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            //Dont have an account? Signup
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  "Dont Have an Account?",
                  style: TextStyle(fontSize: 12),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text(
                    'Signup',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            // Signup Button
            SizedBox(
              width: 360,
              child: FloatingActionButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  )
                      .then((value) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (Route<dynamic> route) => false,
                    );
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Error'),
                    ));
                  });
                },
                child: const Text('Log In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
