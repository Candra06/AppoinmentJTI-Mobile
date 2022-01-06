// ignore_for_file: use_key_in_widget_constructors

import 'package:appointment/components/costume_bottom_navigation.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'components/body.dart';

class ProfilScreen extends StatelessWidget {
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: const Center(),
      ),
      body: const Body(),
      bottomNavigationBar: const CostumeBottomNavigationBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
