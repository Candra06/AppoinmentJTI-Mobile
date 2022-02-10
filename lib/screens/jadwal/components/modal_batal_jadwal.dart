import 'package:appointment/constants.dart';
import 'package:flutter/material.dart';

class ModalBatalJadwal extends StatefulWidget {
  final String? idJadwal;
  const ModalBatalJadwal({Key? key, this.idJadwal}) : super(key: key);

  @override
  _ModalBatalJadwalState createState() => _ModalBatalJadwalState();
}

class _ModalBatalJadwalState extends State<ModalBatalJadwal> {
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
                      'Batalkan Jadwal',
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
                      margin: EdgeInsets.only(left: 4, top: 8),
                      decoration: BoxDecoration(
                        color: Warna().kPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // print(widget.idCuti);
                          // print(txtKeterangan.text);
                          // if (txtKeterangan.text.isEmpty) {
                          //   Config.alert(0, 'Masukkan alasan batal cuti');
                          // } else {
                          //   updateStatus();
                          // }
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
