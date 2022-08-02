import 'package:flutter/material.dart';
import 'package:restora/utils/colors.dart';
import 'package:restora/utils/firebase_config.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: key,
      debugShowCheckedModeBanner: false,
      home: const FirebaseConfig(),
      theme: Theme.of(context).copyWith(
        primaryIconTheme: const IconThemeData(color: kSecondaryTintColor),
        primaryColor: kSecondaryTintColor,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: kSecondaryTintColor),
      ),
    );
  }
}
