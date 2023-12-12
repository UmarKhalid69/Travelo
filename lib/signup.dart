import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_se/Home.dart';
import 'package:travel_app_se/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';
  String confirmPassword = '';

  // Email controller
  final TextEditingController emailController = TextEditingController();
// Password controller
  final TextEditingController passwordController = TextEditingController();
// confirm password controller
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;
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
      child: Column(children: [
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
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //already have an account? Login in
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 70,
            ),
            const Text('Already have an account?'),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Login'),
            ),
          ],
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
                email: emailController.text,
                password: passwordController.text,
              )
                  .then((value) {
                emailController.clear();
                passwordController.clear();
                confirmPasswordController.clear();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false,
                );
              }).onError((error, stackTrace) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.toString()),
                  ),
                );
              });
            },
            child: const Text('Sign Up'),
          ),
        ),
      ]),
    ));
  }
}
