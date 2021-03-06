import 'dart:convert';

import 'package:appointment/constants.dart';
import 'package:appointment/models/prodiModel.dart';
import 'package:appointment/models/userModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/service/user_repository.dart';
import 'package:appointment/utill/network.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormDosen extends StatefulWidget {
  final String? id;
  const FormDosen({Key? key, this.id}) : super(key: key);

  @override
  _FormDosenState createState() => _FormDosenState();
}

class _FormDosenState extends State<FormDosen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController txtName = new TextEditingController();
  TextEditingController txtNIM = new TextEditingController();
  TextEditingController txtEmail = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  String? valProdi, valRole;
  String? password;
  List<Map<String, dynamic>> prodi = [];
  List<Map<String, dynamic>> role = [];
  bool load = true;

  UserRepository repository = new UserRepository();

  UserModel model = new UserModel();

  void saveUser() async {
    if (txtPassword.text.isEmpty) {
      Config.alert(0, 'Password tidak boleh kosong');
    } else {
      model.name = txtName.text;
      model.nipNim = txtNIM.text;
      model.idRole = '2';
      model.email = txtEmail.text;
      model.password = txtPassword.text;
      model.idProdi = valProdi;

      Map<String, dynamic>? respon = await repository.postUser(model);
      if (respon!['status'] == true) {
        Config.alert(1, respon['message']);
        Navigator.pushNamed(context, Routes.HOME_ADMIN);
      } else {
        Config.alert(1, respon['message']);
      }
    }
  }

  void getData() async {
    setState(() {
      load = true;
    });
    if (widget.id != '0') {
      getDetail();
    }
    List<ProdiModel> tmpProdi = await repository.listProdi();
    for (var i = 0; i < tmpProdi.length; i++) {
      prodi.add({
        "id_prodi": tmpProdi[i].idProdi,
        "nama_prodi": tmpProdi[i].namaProdi,
      });
    }
    setState(() {
      load = false;
    });
  }

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
            child: Text(value["nama_prodi"]),
            value: value["id_prodi"],
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

  void getDetail() async {
    setState(() {
      load = true;
    });
    http.Response req = await http.get(Uri.parse(EndPoint.detailUser + widget.id!));
    var data = json.decode(req.body);
    model = UserModel.fromJson(data['data']);
    txtName.text = model.name!;
    txtEmail.text = model.email!;
    txtNIM.text = model.nipNim!;
    valProdi = model.idProdi!;
    password = model.password!;

    setState(() {
      load = false;
    });
  }

  void updateUser() async {
    model.name = txtName.text;
    model.nipNim = txtNIM.text;
    model.idRole = '3';
    model.email = txtEmail.text;
    model.idProdi = valProdi;
    if (txtPassword.text.isEmpty) {
      model.password = password;
    } else {
      model.password = txtPassword.text;
    }

    Map<String, dynamic>? respon = await repository.updateUser(model, widget.id!);
    if (respon!['status'] == true) {
      Config.alert(1, respon['message']);
      Navigator.pushNamed(context, Routes.HOME_ADMIN);
    } else {
      Config.alert(1, respon['message']);
    }
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
        // automaticallyImplyLeading: false,

        title: Text(
          widget.id! == '0' ? 'Tambah Dosen' : 'Edit Dosen',
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
                buildFormField('Nama Lengkap', 'Masukkan nama dosen', txtName, TextInputType.text),
                SizedBox(
                  height: 12,
                ),
                buildFormField('NIP', 'Masukkan NIP dosen', txtNIM, TextInputType.text),
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 65,
                  padding: EdgeInsets.fromLTRB(16, 9, 16, 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.black)),
                  child: DropdownButton(
                    underline: SizedBox(),
                    hint: Text(
                      'Pilih prodi',
                      style: TextStyle(
                        color: Warna().kSecondaryColor,
                      ),
                    ),
                    isExpanded: true,
                    value: valProdi,
                    items: prodi.map((value) {
                      return DropdownMenuItem(
                        child: Text(value["nama_prodi"]),
                        value: value["id_prodi"],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        valProdi = value.toString();
                        print(valProdi);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                buildFormField('Email', 'Masukkan email dosen', txtEmail, TextInputType.emailAddress),
                SizedBox(
                  height: 12,
                ),
                konstan.buildFormPasswordField('Password', 'Masukkan password', txtPassword, TextInputType.text),
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
                    onPressed: () {
                      if (txtName.text.isEmpty) {
                        print('nama tidak boleh kosong');
                      } else if (txtEmail.text.isEmpty) {
                        print('email tidak boleh kosong');
                      } else if (txtNIM.text.isEmpty) {
                        print('nim tidak boleh kosong');
                      } else if (valProdi == Null) {
                        print('prodi tidak boleh kosong');
                      } else {
                        if (widget.id != '0') {
                          updateUser();
                        } else {
                          saveUser();
                        }
                      }
                    },
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
