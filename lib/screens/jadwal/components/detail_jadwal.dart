import 'package:appointment/constants.dart';
import 'package:appointment/screens/jadwal/components/modal_batal_jadwal.dart';
import 'package:appointment/screens/jadwal/components/modal_respon_jadwal.dart';
import 'package:flutter/material.dart';

class DetailJadwal extends StatefulWidget {
  final String? id;
  const DetailJadwal({Key? key, this.id}) : super(key: key);

  @override
  _DetailJadwalState createState() => _DetailJadwalState();
}

class _DetailJadwalState extends State<DetailJadwal> {
  void _batalkanJadwal(String id) async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return ModalBatalJadwal(
              // idJadwal: id,
              );
        });
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
              // idCuti: id,
              );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        centerTitle: false,
        title: Text(
          'Detail Jadwal',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
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
                    'Judul Jadwal',
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
                  Text('Dosen'),
                  Text(
                    'Nama Dosen',
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
                    '22 Februari 2022 08.00',
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
                    '22 Februari 2022 09.00',
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
                  Text('Status'),
                  Text(
                    'Waiting',
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
              Text('Pesan'),
              Text(
                'Pesan jadwal',
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Warna().kDanger,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    _batalkanJadwal('id');
                  },
                  child: Text(
                    'Batalkan Jadwal',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
