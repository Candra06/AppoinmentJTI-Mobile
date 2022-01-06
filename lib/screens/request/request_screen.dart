// ignore_for_file: use_key_in_widget_constructors

import 'package:appointment/screens/event/event_screen.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'components/body.dart';
import '../../components/the_header.dart';

class RequestScreen extends StatelessWidget {
  static String routeName = "/request";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          const TheHeader(
            userSearchField: true,
          ),
        ],
        leadingWidth: SizeConfig.screenWidth! / 15,
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, EventScreen.routeName),
        child: const Icon(Icons.date_range_outlined),
      ),
    );
  }
}
