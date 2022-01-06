import 'package:flutter/material.dart';

import '../../../size_config.dart';

class TheBanner extends StatelessWidget {
  const TheBanner({
    Key? key, required this.textTite, required this.textValue, required this.colors,
  }) : super(key: key);
  final String textTite, textValue;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          text: "$textTite\n",
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: textValue,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ),
    );
  }
}
