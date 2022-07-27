import 'package:flutter/material.dart';
import 'package:restora/data.dart';
import 'package:restora/pages/home/home_app_par.dart';
import 'package:restora/pages/home/urun_card.dart';
import 'package:restora/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double scrollPosition = 0;
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController(
      initialScrollOffset: scrollPosition,
    );
    scrollController.addListener(() {
      setState(() {
        scrollPosition = scrollController.position.pixels;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: HomeAppBar(
          context: context,
          scrollPosition: scrollPosition,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kSecondaryColor, kSecondaryColor],
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                const SizedBox(height: 60),
                ...data.map((model) => UrunCard(model: model)).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
