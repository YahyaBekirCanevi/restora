import 'package:firebase_auth/firebase_auth.dart';
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
    var title = useState("Welcome");
    var pageType = useState(PageType.walkTrough);
    var panelShown = useState(false);

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
              top: height * (panelShown.value ? .04 : .24),
              right: 0,
              left: panelShown.value ? width * .4 : 0,
              child: Center(
                child: RestoraImage(
                  height: panelShown.value ? 200 : 240,
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
                  onLogin: () {
                    title.value = "Welcome back!";
                    pageType.value = PageType.signin;
                  },
                  onJoin: () {
                    title.value = "Come on in!";
                    pageType.value = PageType.signup;
                  },
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
                child: AnimatedOpacity(
                  duration: _duration,
                  opacity: pageType.value != PageType.walkTrough ? 1 : 0,
                  onEnd: () =>
                      panelShown.value = pageType.value != PageType.walkTrough,
                  child: Visibility(
                    visible: panelShown.value,
                    child: Panel(
                      title: title.value,
                      pageType: pageType.value,
                      onClose: () => pageType.value = PageType.walkTrough,
                    ),
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
