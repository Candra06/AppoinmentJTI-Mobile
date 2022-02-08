import 'package:appointment/routs.dart';
import 'package:appointment/screens/master/dosen/itemDosen.dart';
import 'package:appointment/screens/master/mahasiswa/itemMahasiswa.dart';
import 'package:flutter/material.dart';

class ListDosen extends StatefulWidget {
  const ListDosen({Key? key}) : super(key: key);

  @override
  _ListDosenState createState() => _ListDosenState();
}

class _ListDosenState extends State<ListDosen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.ADD_DOSEN);
              },
              icon: Icon(Icons.add))
        ],
        title: Text(
          'Data Dosen',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(itemBuilder: (BuildContext context, int i) {
          return ItemDosen();
        }),
      ),
    );
  }
}
