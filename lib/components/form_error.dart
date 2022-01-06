import 'package:flutter/material.dart';

import '../size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.error,
  }) : super(key: key);

  final List<String> error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        error.length,
        (index) => formErrorText(
          error: error[index],
        ),
      ),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        Icon(
          Icons.error_outline,
          size: getProportionateScreenWidth(14),
        ),
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
