import 'package:appointment/constants.dart';
import 'package:appointment/models/pengajuanModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/screens/jadwal/components/modal_batal_jadwal.dart';
import 'package:appointment/screens/jadwal/components/modal_respon_jadwal.dart';
import 'package:appointment/service/pengajuan_repository.dart';
import 'package:appointment/utill/preference.dart';
import 'package:flutter/material.dart';

class DetailJadwal extends StatefulWidget {
  final String? id;
  const DetailJadwal({Key? key, this.id}) : super(key: key);

  @override
  _DetailJadwalState createState() => _DetailJadwalState();
}

class _DetailJadwalState extends State<DetailJadwal> {
  String? role;
  void _batalkanJadwal(String id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text("Konfirmasi Batal"),
            content: new Text("Apakah anda yakin ingin membatalkan jadwal?"),
            actions: [
              FlatButton(
                  child: Text('Tutup'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              FlatButton(
                  child: Text('Konfirmasi'),
                  onPressed: () {
                    cancelJadwal(id);
                  })
            ],
          );
        });
  }

  Future<PengajuanModel?>? pengajuan;
  PengajuanRepository repository = PengajuanRepository();
  bool load = true;
  void cancelJadwal(String id) async {
    Map<String, dynamic>? respon = await repository.batalEventMahasiswa(id);
    if (respon?['status'] == true) {
      Navigator.pushNamed(context, Routes.HOME_MAHASISWA);
      Config.alert(1, 'Berhasil membatalkan jadwal');
    } else {
      Navigator.of(context).pop();
      Config.alert(0, 'Gagal membatalkan jadwal');
    }
  }

  void getData() async {
    String tmpRole = await Pref.getRole();
    setState(() {
      role = tmpRole;
      load = true;
    });
    pengajuan = repository.detailPengajuanMahasiswa(widget.id!);

    setState(() {
      load = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void _responJadwal(String id) async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return ModalResponJadwal(
            idJadwal: id,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (role == '2') {
                Navigator.pushNamed(context, Routes.HOME_DOSEN);
              } else {
                Navigator.pushNamed(context, Routes.HOME_MAHASISWA);
              }
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: false,
        title: Text(
          'Detail Jadwal',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<PengajuanModel?>(
        future: pengajuan,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          } else {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Judul'),
                          Text(
                            snapshot.data!.title!,
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
                          Text(role == '2' ? 'Mahasiswa' : 'Dosen'),
                          Text(
                            snapshot.data!.name ?? '-',
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
                          Text('Waktu Mulai'),
                          Text(
                            snapshot.data!.startEvent == null ? '-' : Config.formatDateTime(snapshot.data!.startEvent!),
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
                          Text('Waktu Selesai'),
                          Text(
                            snapshot.data!.endEvent == null ? '-' : Config.formatDateTime(snapshot.data!.endEvent!),
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
                        children: [Text('Status'), Config.statusProspek(snapshot.data!.status!)],
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
                      Text('Pesan'),
                      Text(
                        snapshot.data!.message ?? '-',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      if (snapshot.data!.status! == 'waiting') ...{
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: role == '3' ? Warna().kDanger : Colors.yellow[900],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {
                              if (role == '3') {
                                _batalkanJadwal(snapshot.data!.id!);
                              } else {
                                _responJadwal(snapshot.data!.id!);
                              }
                            },
                            child: Text(
                              role == '3' ? 'Batalkan Jadwal' : 'Respon Jadwal',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      }
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
