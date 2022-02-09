import 'package:appointment/models/userModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/master/dosen/itemDosen.dart';
import 'package:appointment/screens/master/mahasiswa/itemMahasiswa.dart';
import 'package:appointment/service/user_repository.dart';
import 'package:flutter/material.dart';

class DetailMahasiswa extends StatefulWidget {
  final String? id;
  const DetailMahasiswa({Key? key, this.id}) : super(key: key);

  @override
  _DetailMahasiswaState createState() => _DetailMahasiswaState();
}

class _DetailMahasiswaState extends State<DetailMahasiswa> {
  Future<UserModel?>? dataMahasiswa;
  UserRepository repository = UserRepository();
  bool load = true;

  void getData() async {
    setState(() {
      load = true;
    });
    dataMahasiswa = repository.detailUser(widget.id!);

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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.ADD_DOSEN);
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.ADD_DOSEN);
              },
              icon: Icon(Icons.delete))
        ],
        title: Text(
          'Detail Mahasiswa',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: load
          ? LinearProgressIndicator()
          : FutureBuilder<UserModel?>(
              future: dataMahasiswa,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LinearProgressIndicator();
                } else {
                  return snapshot.hasData
                      ? SingleChildScrollView(
                          child: Container(
                          margin: EdgeInsets.all(16),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Nama Mahasiswa'),
                                Text(
                                  snapshot.data!.name!,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('NIM'),
                                Text(
                                  snapshot.data!.nipNim!,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Email'),
                                Text(
                                  snapshot.data!.email!,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Prodi'),
                                Text(
                                  snapshot.data!.idProdi!,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 16,
                            )
                          ]),
                        ))
                      : Center(
                          child: Text('Tidak ada data dosen'),
                        );
                }
              },
            ),
    );
  }
}
