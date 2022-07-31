part of 'login_page.dart';

class WalkTrough extends StatelessWidget {
  const WalkTrough({
    Key? key,
    required this.onLogin,
    required this.onJoin,
  }) : super(key: key);
  final Function() onLogin, onJoin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: kBoxShadow(kPrimaryColor.withOpacity(.3)),
              ),
              height: 50,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Text(
                        "Continue with Google",
                        style: h1TextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => onLogin(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: kSecondaryTintColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: kBoxShadow(kSecondaryColor.withOpacity(.4)),
                    ),
                    height: 50,
                    child:
                        const Center(child: Text("Login", style: h1TextStyle)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () => onJoin(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: kSecondaryTintColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: kBoxShadow(kSecondaryColor.withOpacity(.4)),
                    ),
                    height: 50,
                    child: const Center(
                        child: Text("Join Now", style: h1TextStyle)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
