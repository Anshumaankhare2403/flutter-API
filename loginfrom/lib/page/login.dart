// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/input.dart';
import '../components/button.dart';
import './ragistration.dart';

class LoginRagistraion extends StatefulWidget {
  const LoginRagistraion({super.key});

  @override
  State<LoginRagistraion> createState() => _LoginRagistraionState();
}

class _LoginRagistraionState extends State<LoginRagistraion> {
  final _emailController = TextEditingController();
  final _PasswordController = TextEditingController();

  Future SingIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _PasswordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController;
    _PasswordController;
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
              // log
              SizedBox(
                height: 45,
              ),
              Center(
                child: Icon(
                  Icons.lock,
                  color: Colors.black,
                  size: 100.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // text
              Center(
                  child: const Text(
                "Wellcom To this Login Page",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38),
              )),
              SizedBox(
                height: 20,
              ),
              // input email
              Input(
                  controller: _emailController,
                  hintText: "UserName",
                  obscureText: false),
              // imput pass
              SizedBox(
                height: 20,
              ),
              Input(
                  controller: _PasswordController,
                  hintText: "PassWord",
                  obscureText: true),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password ? ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Button(
                onTap: SingIn,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Registration()),
                  );
                },
                child: Text(
                  "Registration",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
