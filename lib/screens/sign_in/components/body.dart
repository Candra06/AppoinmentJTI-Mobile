import 'package:appointment/components/social_card.dart';
import 'package:appointment/screens/sign_in/components/sign_in_from.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign in with your email and password \nor continue with sosial media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                const SignInForm(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
