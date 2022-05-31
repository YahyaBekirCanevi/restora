import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restora/components/custom_animated_button.dart';
import 'package:restora/components/custom_text.dart';
import 'package:restora/components/custom_text_box.dart';
import 'package:restora/pages/home/home_page.dart';
import 'package:restora/utils/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kSecondaryColor,
                kSecondaryTintColor.withOpacity(0.6),
                kSecondaryColor,
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const _TopImage(),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: _Panel(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Welcome back,',
                size: 30,
                color: kSecondaryColor,
                weight: FontWeight.w500,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kSecondaryColor, width: 0.8),
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: Center(
                    child: Icon(
                      Icons.call,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 0.8, color: kSecondaryColor),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextBox(
            borderColor: kGreyColor,
            controller: TextEditingController(),
            borderless: false,
            decorationIcon: const Icon(Icons.person),
            label: 'Username',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextBox(
            borderColor: kGreyColor,
            controller: TextEditingController(),
            borderless: false,
            decorationIcon: const Icon(Icons.person),
            label: 'Password',
            obscureBool: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomHoverAnimatedButton(
            primaryColor: kSecondaryTintColor,
            borderRadious: 20,
            height: 50,
            secondaryColor: Colors.white,
            text: 'Save',
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TopImage extends StatelessWidget {
  const _TopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(height: 180),
        Center(
          child: Image.asset(
            'assets/images/restora.png',
            height: 120,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'Restora',
              style: GoogleFonts.raleway().copyWith(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ],
    );
  }
}
