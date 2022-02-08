import 'package:flutter/material.dart';

class AddEventDosen extends StatefulWidget {
  const AddEventDosen({Key? key}) : super(key: key);

  @override
  _AddEventDosenState createState() => _AddEventDosenState();
}

class _AddEventDosenState extends State<AddEventDosen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Tambah Event',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
