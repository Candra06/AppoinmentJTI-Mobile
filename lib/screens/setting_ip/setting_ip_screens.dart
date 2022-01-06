import 'package:flutter/material.dart';

import 'components/body.dart';

// ignore: use_key_in_widget_constructors
class SettingIpScreens extends StatelessWidget {
  static String routeName = "/setting_ip";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting Ip"),
      ),
      body: const Body(),
    );
  }
}
