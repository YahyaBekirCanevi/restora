import 'package:flutter/material.dart';
import 'package:restora/pages/login/login_page.dart';

void main() {
  runApp(const Application());
}

class Application extends MaterialApp {
  const Application({Key? key})
      : super(
          key: key,
          debugShowCheckedModeBanner: false,
          home: const LoginPage(),
        );
}
