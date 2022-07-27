import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restora/pages/login/login_page.dart';
import 'package:restora/utils/colors.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({Key? key, context, scrollPosition})
      : super(
          key: key,
          toolbarHeight: 60,
          backgroundColor: kSecondaryTintColor.withOpacity(0.2),
          elevation: scrollPosition > 10 ? 1 : 0,
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
          actions: [
            Center(
              child: Container(
                margin: const EdgeInsets.all(5),
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ],
        );
}
