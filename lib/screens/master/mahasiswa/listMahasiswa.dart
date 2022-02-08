import 'package:appointment/routs.dart';
import 'package:appointment/screens/master/mahasiswa/itemMahasiswa.dart';
import 'package:flutter/material.dart';

class ListMahasiswa extends StatefulWidget {
  const ListMahasiswa({Key? key}) : super(key: key);

  @override
  _ListMahasiswaState createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.ADD_MAHASISWA);
              },
              icon: Icon(Icons.add))
        ],
        title: Text(
          'Data Mahasiswa',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(itemBuilder: (BuildContext context, int i) {
          return ItemMahasiswa();
        }),
      ),
    );
  }
}
