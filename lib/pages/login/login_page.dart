import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restora/components/custom_text.dart';
import 'package:restora/components/custom_text_box.dart';
import 'package:restora/components/restora_image.dart';
import 'package:restora/pages/home/home_page.dart';
import 'package:restora/utils/colors.dart';
import 'package:restora/utils/styles.dart';

part 'panel.dart';
part 'walk_trough.dart';

enum PageType { walkTrough, signin, signup }

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  final _duration = const Duration(milliseconds: 600);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var pageType = useState(PageType.walkTrough);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Text(
            "Restora",
            style: GoogleFonts.akshar(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w600,
              shadows: [
                Shadow(
                  offset: const Offset(2, 2),
                  blurRadius: 8,
                  color: Colors.black.withOpacity(.4),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            /// Background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kSecondaryTintColor.withOpacity(0.6),
                    kSecondaryColor,
                  ],
                ),
              ),
              child: const SizedBox.expand(),
            ),

            /// Icon
            AnimatedPositioned(
              duration: _duration,
              top: height * (pageType.value == PageType.walkTrough ? .24 : .04),
              right: 0,
              left: pageType.value == PageType.walkTrough ? 0 : width * .4,
              child: Center(
                child: RestoraImage(
                  height: pageType.value == PageType.walkTrough ? 240 : 200,
                ),
              ),
            ),

            /// WalkTrough
            Positioned(
              bottom: 100,
              right: 0,
              left: 0,
              child: AnimatedScale(
                duration: _duration,
                scale: pageType.value == PageType.walkTrough ? 1 : 0,
                child: WalkTrough(
                  onLogin: () => pageType.value = PageType.signin,
                  onJoin: () => pageType.value = PageType.signup,
                ),
              ),
            ),

            /// Login / Sign Up
            AnimatedPositioned(
              duration: _duration,
              bottom: 0,
              right: 10,
              left: 10,
              top: height * (pageType.value == PageType.walkTrough ? 1 : .24),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: _Panel(
                    pageType: pageType.value,
                    onClose: () => pageType.value = PageType.walkTrough,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
