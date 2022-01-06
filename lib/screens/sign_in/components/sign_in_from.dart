// ignore_for_file: implementation_imports, unrelated_type_equality_checks

import 'package:appointment/components/befault_button.dart';
import 'package:appointment/components/form_error.dart';
import 'package:appointment/screens/home/home_screen.dart';
import 'package:appointment/service/sercive_provider.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  final List<String> error = [];
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    var _data = Provider.of<ServiceProvider>(context, listen: false);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          builEmailFormField(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          builPasswordFormField(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          FormError(error: error),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                var _log =
                    _data.authentification(email: email, password: password);
                if (_data.status == true) {
                  // _log.whenComplete(() => Navigator.pushReplacementNamed(
                  //     context, HomeScreen.routeName));
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  _log.onError((ex, stackTrace) => error.add("Fail Logins"));
                }
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField builPasswordFormField() {
    return TextFormField(
      obscureText: false,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isEmpty && error.contains(kPassNullError)) {
          setState(() {
            error.remove(kPassNullError);
          });
        } else if (value.length >= 3 && error.contains(kShortPassError)) {
          setState(() {
            error.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !error.contains(kPassNullError)) {
          setState(() {
            error.add(kPassNullError);
          });
        } else if (value.length < 3 && !error.contains(kShortPassError)) {
          setState(() {
            error.add(kShortPassError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock_outline,
        ),
      ),
    );
  }

  TextFormField builEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && error.contains(kEmailNullError)) {
          setState(() {
            error.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            error.contains(kInvalidEmailError)) {
          setState(() {
            error.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !error.contains(kEmailNullError)) {
          setState(() {
            error.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !error.contains(kInvalidEmailError)) {
          setState(() {
            error.add(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.email_outlined,
        ),
      ),
    );
  }
}
