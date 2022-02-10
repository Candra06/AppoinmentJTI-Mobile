import 'package:appointment/constants.dart';
import 'package:appointment/models/topicModel.dart';
import 'package:appointment/models/userModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/service/user_repository.dart';
import 'package:appointment/utill/preference.dart';
import 'package:flutter/material.dart';

class ModalAddTopic extends StatefulWidget {
  const ModalAddTopic({Key? key}) : super(key: key);

  @override
  _ModalAddTopicState createState() => _ModalAddTopicState();
}

class _ModalAddTopicState extends State<ModalAddTopic> {
  bool load = true;
  UserRepository repository = new UserRepository();

  String? valDosen;
  List<Map<String, dynamic>> dosen = [];
  void getData() async {
    setState(() {
      load = true;
    });
    List<UserModel> tmpDosen = await repository.listUser("3");
    for (var i = 0; i < tmpDosen.length; i++) {
      dosen.add({
        "id": tmpDosen[i].idUser,
        "name": tmpDosen[i].name,
      });
    }
    setState(() {
      load = false;
    });
  }

  TextEditingController? txtTopic = new TextEditingController();

  selectDosen() {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: 65,
      padding: EdgeInsets.fromLTRB(16, 9, 16, 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.black)),
      child: DropdownButton(
        underline: SizedBox(),
        hint: Text(
          "Pilih Dosen",
          style: TextStyle(
            color: Warna().kSecondaryColor,
          ),
        ),
        isExpanded: true,
        value: valDosen,
        items: dosen.map((value) {
          return DropdownMenuItem(
            child: Text(value["name"]),
            value: value["id"],
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            valDosen = value.toString();
            print(valDosen);
          });
        },
      ),
    );
  }

  void saveTopic() async {
    String id = await Pref.getIDUser();
    TopicModel topic = new TopicModel();

    topic.idUser = id;
    topic.idDosen = valDosen;
    topic.topic = txtTopic!.text;

    Map<String, dynamic>? respon = await repository.postTopic(topic);
    if (respon!['status'] == true) {
      Config.alert(1, respon['message']);
      Navigator.pushNamed(context, Routes.HOME_MAHASISWA);
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
                      'Tambah Topic',
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
                selectDosen(),
                SizedBox(height: 8),
                buildFormField('Topic Pesan', 'Masukkan topic', txtTopic, TextInputType.text),
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
                          saveTopic();
                        },
                        child: Text(
                          'Kirim Topic',
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
