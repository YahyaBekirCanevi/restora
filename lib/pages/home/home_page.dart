import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restora/pages/login/login_page.dart';
import 'package:restora/utils/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

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
      scrollPosition = scrollController.position.pixels;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: scrollPosition != 0 ? 0 : 1,
          title: Text(
            'Restora',
            style: GoogleFonts.raleway().copyWith(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left, color: Colors.white),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            ),
          ),
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
                for (int i = 0; i < 10; i++)
                  Container(
                    height: 250,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                            child: Image.asset('assets/images/restora.png'),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.white.withOpacity(0.4), Colors.white],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'asd',
                                style: GoogleFonts.arsenal(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
