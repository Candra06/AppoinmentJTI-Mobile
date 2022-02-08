import 'package:appointment/constants.dart';
import 'package:flutter/material.dart';

class FormDosen extends StatefulWidget {
  const FormDosen({Key? key}) : super(key: key);

  @override
  _FormDosenState createState() => _FormDosenState();
}

class _FormDosenState extends State<FormDosen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? txtName = new TextEditingController();
  TextEditingController? txtNIM = new TextEditingController();
  TextEditingController? txtEmail = new TextEditingController();
  TextEditingController? txtPassword = new TextEditingController();
  String? valProdi, valRole;
  List<Map<String, dynamic>> prodi = [];
  List<Map<String, dynamic>> role = [];

  selectOption(String? val, List<Map<String, dynamic>>? list, String? label) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: 65,
      padding: EdgeInsets.fromLTRB(16, 9, 16, 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.black)),
      child: DropdownButton(
        underline: SizedBox(),
        hint: Text(
          label!,
          style: TextStyle(
            color: Warna().kSecondaryColor,
          ),
        ),
        isExpanded: true,
        value: val,
        items: list!.map((value) {
          return DropdownMenuItem(
            child: Text(value["nama"]),
            value: value["id"],
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            val = value.toString();
            print(val);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        // automaticallyImplyLeading: false,

        title: Text(
          'Data Dosen',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                konstan().buildFormField('Nama Lengkap', 'Masukkan nama dosen', txtName, TextInputType.text),
                SizedBox(
                  height: 12,
                ),
                konstan().buildFormField('NIP', 'Masukkan NIP dosen', txtNIM, TextInputType.text),
                SizedBox(
                  height: 8,
                ),
                selectOption(valProdi, prodi, 'Pilih Prodi'),
                SizedBox(
                  height: 8,
                ),
                konstan().buildFormField('Email', 'Masukkan email dosen', txtEmail, TextInputType.emailAddress),
                SizedBox(
                  height: 12,
                ),
                konstan().buildFormPasswordField('Password', 'Masukkan password', txtPassword, TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Warna().kPrimaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Simpan',
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
      ),
    );
  }
}
