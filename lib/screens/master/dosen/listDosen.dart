import 'package:appointment/models/userModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/master/dosen/itemDosen.dart';
import 'package:appointment/screens/master/mahasiswa/itemMahasiswa.dart';
import 'package:appointment/service/user_repository.dart';
import 'package:flutter/material.dart';

class ListDosen extends StatefulWidget {
  const ListDosen({Key? key}) : super(key: key);

  @override
  _ListDosenState createState() => _ListDosenState();
}

class _ListDosenState extends State<ListDosen> {
  Future<List<UserModel>>? listDosen;
  UserRepository repository = UserRepository();
  bool load = true;

  void getData() async {
    setState(() {
      load = true;
    });
    listDosen = repository.listUser("3");

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
                Navigator.pushNamed(context, Routes.ADD_DOSEN, arguments: '0');
              },
              icon: Icon(Icons.add))
        ],
        title: Text(
          'Data Dosen',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: load
          ? LinearProgressIndicator()
          : FutureBuilder<List<UserModel>>(
              future: listDosen,
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
                                return ItemDosen(
                                  data: snapshot.data![i],
                                );
                              }),
                        )
                      : Center(
                          child: Text('Tidak ada data dosen'),
                        );
                }
              },
            ),
    );
  }
}
