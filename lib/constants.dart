import 'dart:core';

import 'package:appointment/components/costume_suffix_icon.dart';
import 'package:appointment/size_config.dart';
import 'package:flutter/material.dart';

class Warna {
  final Color? kPrimaryColor = Color(0xFF5043FF);
  final kPrimaryLightColor = Color(0xFFE0DFFF);
  final kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3ED8FF), Color(0xFF43D3FF)],
  );

  final kSecondaryColor = Color(0xFF979797);
  final Color? kWarning = (Colors.amber[900]);
  final Color? kDanger = (Colors.red);
  final kTextColor = Color(0xFF757575);

  final defaultDuration = Duration(milliseconds: 250);
}

class konstan {
  TextFormField buildFormField(String? label, String? hint, TextEditingController? controller, TextInputType type) {
    return TextFormField(
      keyboardType: type,
      // onSaved: (newValue) => titel = newValue,

      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildFormPasswordField(String? label, String? hint, TextEditingController? controller, TextInputType type) {
    return TextFormField(
      keyboardType: type,
      obscureText: true,
      // onSaved: (newValue) => titel = newValue,

      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildFormFieldMultiLine(String? label, String? hint, TextEditingController? controller, TextInputType? type) {
    return TextFormField(
      maxLines: 3,
      keyboardType: type,
      // onSaved: (newValue) => titel = newValue,

      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}

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
final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
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
  contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
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
