import 'package:appointment/models/userModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/master/mahasiswa/itemMahasiswa.dart';
import 'package:appointment/service/user_repository.dart';
import 'package:flutter/material.dart';

class ListMahasiswa extends StatefulWidget {
  const ListMahasiswa({Key? key}) : super(key: key);

  @override
  _ListMahasiswaState createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  Future<List<UserModel>>? listmahasiswa;
  UserRepository repository = UserRepository();
  bool load = true;

  void getData() async {
    setState(() {
      load = true;
    });
    listmahasiswa = repository.listUser("2");

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
      body: load
          ? LinearProgressIndicator()
          : FutureBuilder<List<UserModel>>(
              future: listmahasiswa,
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
                                return ItemMahasiswa(
                                  data: snapshot.data![i],
                                );
                              }),
                        )
                      : Center(
                          child: Text('Tidak ada data mahasiswa'),
                        );
                }
              },
            ),
    );
  }
}
