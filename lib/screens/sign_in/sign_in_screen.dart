// ignore_for_file: use_key_in_widget_constructors
import 'package:appointment/screens/setting_ip/setting_ip_screens.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, SettingIpScreens.routeName),
              icon: Icon(Icons.settings))
        ],
        title: const Text("Sign In"),
      ),
      body: const Body(),
    );
  }
}
