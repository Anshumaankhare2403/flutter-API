import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './home_page.dart';
import './login.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginRagistraion();
          }
        },
      ),
    );
  }
}
