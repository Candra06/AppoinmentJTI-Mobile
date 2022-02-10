import 'package:appointment/models/pengajuanModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/service/pengajuan_repository.dart';
import 'package:appointment/utill/preference.dart';
import 'package:flutter/material.dart';

class HomeBodyMahasiswa extends StatefulWidget {
  const HomeBodyMahasiswa({Key? key}) : super(key: key);

  @override
  _HomeBodyMahasiswaState createState() => _HomeBodyMahasiswaState();
}

class _HomeBodyMahasiswaState extends State<HomeBodyMahasiswa> {
  Future<List<PengajuanModel>>? listPengajuan;
  PengajuanRepository repository = PengajuanRepository();
  bool load = true;
  String? role;

  void getData() async {
    String id = await Pref.getIDUser();
    String tmpRole = await Pref.getRole();
    setState(() {
      role = tmpRole;
      load = true;
    });
    if (role == '3') {
      listPengajuan = repository.listPengajuanMahasiswa(id);
    } else {
      listPengajuan = repository.listPengajuanByDosen(id);
    }

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
          if (role == '3') ...{
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.JADWAL_DOSEN);
                },
                icon: Icon(Icons.add))
          }
        ],
        title: Text(
          role == '3' ? 'Request Saya' : 'Request Mahasiswa',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: load
          ? LinearProgressIndicator()
          : FutureBuilder<List<PengajuanModel>>(
              future: listPengajuan,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LinearProgressIndicator();
                } else {
                  print(snapshot.data!.length);
                  return snapshot.hasData
                      ? Container(
                          padding: EdgeInsets.all(16),
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int i) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, Routes.DETAIL_JADWAL, arguments: snapshot.data![i].id!);
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(snapshot.data![i].title!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              Config.statusProspek(snapshot.data![i].status!),
                                            ],
                                          ),
                                          Text(snapshot.data![i].name!),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          // Text('Keterangan'),
                                          // Text('Lorem Ipsum'),
                                          // SizedBox(
                                          //   height: 8,
                                          // ),
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     Text('Tanggal Mulai'),
                                          //     Text('Tanggal Selesai'),
                                          //   ],
                                          // ),
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     Text('22 Februari 2022 (08.00)'),
                                          //     Text('22 Februari 2022 (08.00)'),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }))
                      : Center(
                          child: Text('Tidak ada pengajuan jadwal'),
                        );
                }
              },
            ),
    );
  }
}
