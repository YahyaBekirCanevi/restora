// ignore_for_file: avoid_print

part of 'login_page.dart';

class Panel extends HookWidget {
  const Panel({
    Key? key,
    required this.pageType,
    required this.title,
    required this.onClose,
  }) : super(key: key);

  final PageType pageType;
  final String title;
  final Function() onClose;

  @override
  Widget build(BuildContext context) {
    var emailController = useTextEditingController();
    var passwordController = useTextEditingController();
    useEffect(() {
      return () {
        emailController.dispose();
        passwordController.dispose();
      };
    }, []);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              top: 20,
              bottom: 4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: title,
                  size: 30,
                  color: kSecondaryColor,
                  weight: FontWeight.w500,
                ),
                InkWell(
                  onTap: () => onClose(),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 26,
                        color: kSecondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, color: kSecondaryColor),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomTextBox(
                    borderColor: kGreyColor,
                    controller: emailController,
                    borderless: false,
                    decorationIcon: const Icon(Icons.mail_outline),
                    label: 'Email address',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomTextBox(
                    borderColor: kGreyColor,
                    controller: passwordController,
                    borderless: false,
                    decorationIcon: const Icon(Icons.lock_outline),
                    label: 'Password',
                    obscureBool: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () async {
                      try {
                        if (pageType == PageType.signin) {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        } else if (pageType == PageType.signup) {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: kSecondaryTintColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: kBoxShadow(kSecondaryColor.withOpacity(.4)),
                      ),
                      child: Center(
                        child: Text(
                          pageType == PageType.signup ? "Sign Up" : "Login",
                          style: h1TextStyle,
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
    );
  }
}
