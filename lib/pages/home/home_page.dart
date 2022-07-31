import 'package:flutter/material.dart';
import 'package:restora/data.dart';
import 'package:restora/pages/home/home_app_par.dart';
import 'package:restora/pages/home/urun_card.dart';
import 'package:restora/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: HomeAppBar(context: context),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kSecondaryColor,
                kSecondaryTintColor.withOpacity(.6),
                kSecondaryColor,
              ],
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, i) => UrunCard(model: data[i]),
          ),
        ),
      ),
    );
  }
}
