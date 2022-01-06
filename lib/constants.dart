import 'dart:core';

import 'package:appointment/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF5043FF);
const kPrimaryLightColor = Color(0xFFE0DFFF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF3ED8FF), Color(0xFF43D3FF)],
);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const defaultDuration = Duration(milliseconds: 250);

//error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kIpNullError = "Please Enter your Ip";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kInvalidIpError = "Please Enter Valid Email";
const String kTitelNullError = "Please Enter your Titel";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kDateStartError = "Please Enter your Date Start";
const String kDateEndError = "Please Enter your Date End";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}
