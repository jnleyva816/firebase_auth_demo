import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRegistering = false;

  Future<void> _register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isRegistering ? 'Register' : 'Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: isRegistering ? _register : _login,
              child: Text(isRegistering ? 'Register' : 'Login'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isRegistering = !isRegistering;
                });
              },
              child: Text(isRegistering ? 'Already have an account? Login' : 'Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
