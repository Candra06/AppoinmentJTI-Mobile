// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:appointment/size_config.dart';

import 'components/body.dart';

class JadwalScreen extends StatelessWidget {
  static String routeName = "/jadwal";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final DetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as DetailsArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Membuat Jadwal"),
      ),
      body: Body(product: agrs.product),
    );
  }
}

class DetailsArguments {
  final String product;

  DetailsArguments({required this.product});
}
