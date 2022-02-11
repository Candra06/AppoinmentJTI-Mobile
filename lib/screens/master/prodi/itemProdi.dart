import 'package:appointment/models/prodiModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/screens/master/prodi/modal_add_prodi.dart';
import 'package:appointment/service/user_repository.dart';
import 'package:flutter/material.dart';

class ItemProdi extends StatefulWidget {
  final ProdiModel? data;
  const ItemProdi({Key? key, this.data}) : super(key: key);

  @override
  _ItemProdiState createState() => _ItemProdiState();
}

class _ItemProdiState extends State<ItemProdi> {
  UserRepository repository = new UserRepository();
  void confirmDelete(String id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text("Konfirmasi Hapus"),
            content: new Text("Apakah anda yakin ingin menghapus data?"),
            actions: [
              FlatButton(
                  child: Text('Tutup'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              FlatButton(
                  child: Text('Konfirmasi'),
                  onPressed: () {
                    deleteData(id);
                  })
            ],
          );
        });
  }

  void deleteData(String id) async {
    Map<String, dynamic>? response = await repository.deleteProdi(id);
    if (response!['status'] == true) {
      Config.alert(1, 'Berhasil menghapus data');
      Navigator.pushNamed(context, Routes.HOME_ADMIN);
    } else {
      Config.alert(0, 'Gagal menghapus data');
    }
  }

  void _addProdi(String id, String nama) async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return ModalAddProdi(
            idProdi: id,
            namaProdi: nama,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.data!.namaProdi!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            _addProdi(widget.data!.idProdi!, widget.data!.namaProdi!);
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            confirmDelete(widget.data!.idProdi!);
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  )
                ],
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
  }
}
