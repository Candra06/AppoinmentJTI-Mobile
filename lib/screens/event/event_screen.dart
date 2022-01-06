// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:appointment/size_config.dart';

import 'components/body.dart';

class EventScreen extends StatelessWidget {
  static String routeName = "/event";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Membuat Jadwal"),
      ),
      body: Body(),
    );
  }
}
