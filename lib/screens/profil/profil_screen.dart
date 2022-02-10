// ignore_for_file: use_key_in_widget_constructors

import 'package:appointment/components/costume_bottom_navigation.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'components/body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: const Center(),
      ),
      body: const Body(),
    );
  }
}
