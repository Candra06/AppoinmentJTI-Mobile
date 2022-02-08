// ignore_for_file: use_key_in_widget_constructors
import 'package:appointment/components/costume_bottom_navigation.dart';
import 'package:appointment/components/the_header.dart';
import 'package:flutter/material.dart';
import '../../enums.dart';
import '../../size_config.dart';
import 'components/body.dart';

class UserView extends StatelessWidget {
  static String routeName = "/user";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          TheHeader(
            titel: "Data User",
          )
        ],
        backgroundColor: Colors.transparent,
        leading: Container(),
        leadingWidth: 0,
      ),
      body: const Body(),
      bottomNavigationBar: const CostumeBottomNavigationBar(
        selectedMenu: MenuState.user,
      ),
    );
  }
}
