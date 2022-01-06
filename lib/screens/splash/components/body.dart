import 'package:appointment/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

// This is the beast practice
import '../../../constants.dart';
import '../../../size_config.dart';
import '../components/splash_content.dart';
import '../../../components/befault_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Selamat datang di Appoitment JTI!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "Kita mengatur kebutuhan anda \ndalam lingkup JTI POLIJE!",
      "image": "assets/images/splash_2.png"
    },
    {
      "text":
          "Kita memberikan kemudahan dalam sidang anda. \nHanya cukup membuka hp anda semua beres!",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  images: splashData[index]["image"].toString(),
                  text: splashData[index]["text"].toString(),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                        text: "Continue",
                        press: () => Navigator.pushReplacementNamed(
                            context, SignInScreen.routeName)),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: defaultDuration,
      margin: const EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        // ignore: use_full_hex_values_for_flutter_colors
        color: currentPage == index ? kPrimaryColor : const Color(0xffd8d8d8d),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
