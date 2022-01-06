import 'package:flutter/material.dart';

import '../size_config.dart';

class CostumeSuffixIcon extends StatelessWidget {
  const CostumeSuffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);
  final IconData svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: Icon(
        svgIcon,
        size: getProportionateScreenWidth(18),
      ),
    );
  }
}
