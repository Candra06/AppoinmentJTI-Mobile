import 'package:appointment/models/prodiModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/master/mahasiswa/itemMahasiswa.dart';
import 'package:appointment/screens/master/prodi/itemProdi.dart';
import 'package:appointment/service/user_repository.dart';
import 'package:flutter/material.dart';

class ListProdi extends StatefulWidget {
  const ListProdi({Key? key}) : super(key: key);

  @override
  _ListProdiState createState() => _ListProdiState();
}

class _ListProdiState extends State<ListProdi> {
   Future<List<ProdiModel>>? listProdi;
  UserRepository repository = UserRepository();
  bool load = true;

  void getData() async {
    setState(() {
      load = true;
    });
    listProdi = repository.listProdi();

    setState(() {
      load = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
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
      body: load
          ? LinearProgressIndicator()
          : FutureBuilder<List<ProdiModel>>(
              future: listProdi,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LinearProgressIndicator();
                } else {
                  return snapshot.hasData
                      ? Container(
                          margin: EdgeInsets.all(16),
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int i) {
                                return ItemProdi(
                                  data: snapshot.data![i],
                                );
                              }),
                        )
                      : Center(
                          child: Text('Tidak ada data prodi'),
                        );
                }
              },
            ),
    );
  }
}
