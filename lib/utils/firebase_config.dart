import 'package:flutter/material.dart';
import 'package:restora/components/restora_image.dart';
import 'package:restora/pages/login/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  initialize(context) async {
    Future.delayed(const Duration(milliseconds: 600));
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: initialize(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const SizedBox();
          } else {
            return const Center(
              child: RestoraImage(
                height: 300,
                width: 200,
              ),
            );
          }
        },
      ),
    );
  }
}
