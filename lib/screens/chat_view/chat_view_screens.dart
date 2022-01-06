// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatViewScreens extends StatelessWidget {
  static String routeName = "/chatview";

  @override
  Widget build(BuildContext context) {
    final DetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as DetailsArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nama User",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      body: Body(
        product: agrs.product.toString(),
        id: agrs.id.toString(),
      ),
    );
  }
}

class DetailsArguments {
  final String product;
  final String id;

  DetailsArguments({required this.id, required this.product});
}
