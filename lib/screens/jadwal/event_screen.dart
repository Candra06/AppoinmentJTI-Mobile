// ignore_for_file: use_key_in_widget_constructors

import 'package:appointment/components/costume_bottom_navigation.dart';
import 'package:appointment/enums.dart';
import 'package:appointment/screens/jadwal/event_dosen.dart';
import 'package:flutter/material.dart';
import 'package:appointment/size_config.dart';

import 'components/body.dart';

class EventScreenDosen extends StatefulWidget {
  const EventScreenDosen({Key? key}) : super(key: key);

  @override
  _EventScreenDosenState createState() => _EventScreenDosenState();
}

class _EventScreenDosenState extends State<EventScreenDosen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          'Jadwal Dosen',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: EventDosenBody(),
    );
  }
}
