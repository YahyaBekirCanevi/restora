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
    return Column(
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
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
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
                      decorationIcon: const Icon(Icons.lock),
                      label: 'Password',
                      obscureBool: true,
                    ),
                  ),
                  if (pageType == PageType.signup)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomTextBox(
                        borderColor: kGreyColor,
                        controller: TextEditingController(),
                        borderless: false,
                        decorationIcon: const Icon(Icons.lock),
                        label: 'Re-Password',
                        obscureBool: true,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      ),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: kSecondaryTintColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:
                              kBoxShadow(kSecondaryColor.withOpacity(.4)),
                        ),
                        child: Center(
                          child: Text(
                              pageType == PageType.signup ? "Sign Up" : "Login",
                              style: h1TextStyle),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
