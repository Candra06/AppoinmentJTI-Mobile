import 'package:appointment/routs.dart';
import 'package:appointment/screens/master/mahasiswa/itemMahasiswa.dart';
import 'package:appointment/screens/master/prodi/itemProdi.dart';
import 'package:flutter/material.dart';

class ListProdi extends StatefulWidget {
  const ListProdi({Key? key}) : super(key: key);

  @override
  _ListProdiState createState() => _ListProdiState();
}

class _ListProdiState extends State<ListProdi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.JADWAL_DOSEN);
              },
              icon: Icon(Icons.add))
        ],
        title: Text(
          'Data Prodi',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(itemBuilder: (BuildContext context, int i) {
          return ItemProdi();
        }),
      ),
    );
  }
}
