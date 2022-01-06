import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.images,
  }) : super(key: key);
  final String text, images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Appointment Jti",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
        const Spacer(flex: 2),
        Image.asset(
          images,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
