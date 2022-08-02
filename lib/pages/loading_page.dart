import 'package:flutter/material.dart';
import 'package:restora/components/restora_image.dart';
import 'package:restora/utils/colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kSecondaryTintColor.withOpacity(.6),
                kSecondaryColor,
              ],
            ),
          ),
          child: const FractionallySizedBox(
            heightFactor: .6,
            widthFactor: .5,
            alignment: Alignment.center,
            child: RestoraImage(width: 200),
          ),
        ),
      ),
    );
  }
}
