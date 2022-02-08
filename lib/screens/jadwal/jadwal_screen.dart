// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:appointment/size_config.dart';

import 'components/body.dart';

class JadwalScreen extends StatefulWidget {
  final String? data;
  const JadwalScreen({Key? key, this.data}) : super(key: key);

  @override
  _JadwalScreenState createState() => _JadwalScreenState();
}

class _JadwalScreenState extends State<JadwalScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Membuat Jadwal",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: JadwalBody(),
    );
  }
}

// class JadwalScreen extends StatelessWidget {
//   static String routeName = "/jadwal";
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         title: const Text(
//           "Membuat Jadwal",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: JadwalBody(),
//     );
//   }
// }

class DetailsArguments {
  final String product;

  DetailsArguments({required this.product});
}
