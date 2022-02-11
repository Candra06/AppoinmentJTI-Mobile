import 'package:appointment/constants.dart';
import 'package:appointment/models/prodiModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/service/user_repository.dart';
import 'package:flutter/material.dart';

class ModalAddProdi extends StatefulWidget {
  final String? idProdi;
  final String? namaProdi;
  const ModalAddProdi({Key? key, this.idProdi, this.namaProdi}) : super(key: key);

  @override
  _ModalAddProdiState createState() => _ModalAddProdiState();
}

class _ModalAddProdiState extends State<ModalAddProdi> {
  UserRepository repository = new UserRepository();
  void save() async {
    ProdiModel prodi = new ProdiModel();

    prodi.namaProdi = txtProdi!.text;

    Map<String, dynamic>? respon = await repository.postProdi(prodi);
    print(respon);
    if (respon!['status'] == true) {
      Config.alert(1, respon['message']);
      Navigator.pushNamed(context, Routes.HOME_ADMIN);
    } else {
      Config.alert(1, respon['message']);
    }
  }

  void update() async {
    ProdiModel prodi = new ProdiModel();

    prodi.namaProdi = txtProdi!.text;

    Map<String, dynamic>? respon = await repository.updateProdi(prodi, widget.idProdi!);
    print(respon);
    if (respon!['status'] == true) {
      Config.alert(1, respon['message']);
      Navigator.pushNamed(context, Routes.HOME_ADMIN);
    } else {
      Config.alert(1, respon['message']);
    }
  }

  TextEditingController? txtProdi = new TextEditingController();

  @override
  void initState() {
    if (widget.namaProdi! != '-') {
      txtProdi!.text = widget.namaProdi!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.idProdi! != '0' ? 'Edit Prodi' : 'Tambah Prodi',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 2,
                ),
                buildFormField('Nama Prodi', 'Masukkan nama prodi', txtProdi, TextInputType.text),
                SizedBox(height: 8),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 4, top: 8),
                      decoration: BoxDecoration(
                        color: Warna().kPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (widget.idProdi! == '0') {
                            save();
                          } else {
                            update();
                          }
                        },
                        child: Text(
                          'Simpan',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
