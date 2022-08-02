import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restora/pages/home/home_page.dart';
import 'package:restora/pages/login/login_page.dart';

class FirebaseConfig extends StatelessWidget {
  const FirebaseConfig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.hasData ? const LoginPage() : const HomePage();
        },
      ),
    );
  }
}
