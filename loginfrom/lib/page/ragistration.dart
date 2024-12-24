import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/input.dart';
import '../components/button.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> register() async {
    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match!")),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration successful!")),
      );

      // Navigate to login or home page after registration
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 45),
              const Center(
                child: Icon(
                  Icons.android,
                  color: Colors.black,
                  size: 100.0,
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "Welcome to this Registration Page",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Input(
                controller: _emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 20),
              Input(
                controller: _passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 12),
              Input(
                controller: _confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true,
              ),
              const SizedBox(height: 30),
              Button(
                onTap: register,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
