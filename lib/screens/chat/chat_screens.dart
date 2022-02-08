// ignore_for_file: use_key_in_widget_constructors

import 'package:appointment/components/the_header.dart';
import 'package:appointment/screens/chat/components/body.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class ChatScreens extends StatelessWidget {
  static String routeName = "/chat";

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: SizeConfig.screenWidth! / 15,
        actions: const [TheHeader()],
      ),
      body: Body(),
    );
  }
}
