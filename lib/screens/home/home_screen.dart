// ignore_for_file: use_key_in_widget_constructors


import 'package:appointment/routs.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.JADWAL_DOSEN);
              },
              icon: Icon(Icons.add))
        ],
        title: Text(
          'Jadwal Saya',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: HomeBodyMahasiswa(),
    );
  }
}
