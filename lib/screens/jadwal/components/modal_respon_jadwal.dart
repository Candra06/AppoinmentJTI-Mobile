import 'package:appointment/constants.dart';
import 'package:appointment/models/pengajuanModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/service/pengajuan_repository.dart';
import 'package:appointment/utill/preference.dart';
import 'package:flutter/material.dart';

class ModalResponJadwal extends StatefulWidget {
  final String? idJadwal;
  const ModalResponJadwal({Key? key, this.idJadwal}) : super(key: key);

  @override
  _ModalResponJadwalState createState() => _ModalResponJadwalState();
}

class _ModalResponJadwalState extends State<ModalResponJadwal> {
  PengajuanRepository repository = new PengajuanRepository();
  void save(String status) async {
    String id = widget.idJadwal!;
    PengajuanModel event = new PengajuanModel();

    event.message = txtAlasan!.text;
    event.status = status;

    Map<String, dynamic>? respon = await repository.responJadwal(id, event);
    print(respon);
    if (respon!['status'] == true) {
      Config.alert(1, respon['message']);
      Navigator.pushNamed(context, Routes.HOME_DOSEN);
    } else {
      Config.alert(1, respon['message']);
    }
  }

  TextEditingController? txtAlasan = new TextEditingController();
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
                      'Respon Jadwal',
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
                konstan.buildFormFieldMultiLine('Pesan', 'Masukkan alasan', txtAlasan, TextInputType.text),
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
                      margin: EdgeInsets.only(right: 4, top: 8),
                      decoration: BoxDecoration(
                        color: Warna().kDanger,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          save('reject');
                        },
                        child: Text(
                          'Tolak',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    )),
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
                          save('accept');
                        },
                        child: Text(
                          'Terima',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
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
