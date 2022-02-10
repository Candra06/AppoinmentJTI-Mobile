// ignore_for_file: use_key_in_widget_constructors

import 'package:appointment/models/eventDosenModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/service/pengajuan_repository.dart';
import 'package:appointment/utill/preference.dart';
import 'package:flutter/material.dart';

class EventScreenDosen extends StatefulWidget {
  const EventScreenDosen({Key? key}) : super(key: key);

  @override
  _EventScreenDosenState createState() => _EventScreenDosenState();
}

class _EventScreenDosenState extends State<EventScreenDosen> {
  Future<List<EventDosenModel>>? listEvent;
  PengajuanRepository repository = PengajuanRepository();
  bool load = true;

  String? role;
  void getData() async {
    String tmpRole = await Pref.getRole();
    String id = await Pref.getIDUser();
    setState(() {
      load = true;
      role = tmpRole;
      print(role);
    });
    if (role == '3') {
      listEvent = repository.listEventDosenByMahasiswa();
    } else {
      listEvent = repository.listEventDosenByDosen(id);
    }

    setState(() {
      load = false;
    });
  }

  void deleteEvent(String idEvent) async {
    setState(() {
      load = true;
    });
    Map<String, dynamic>? respon = await repository.deleteEventDosen(idEvent);
    if (respon!['status'] == true) {
      getData();
      Config.alert(1, respon['message']);
      Navigator.pushNamed(context, Routes.HOME_DOSEN);
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
        automaticallyImplyLeading: false,
        title: Text(
          'Jadwal Dosen',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          if (role == '2') ...{
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, Routes.ADD_EVENT);
              },
            )
          }
        ],
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<EventDosenModel>>(
        future: listEvent,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          } else {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text('Tidak ada event dosen'),
              );
            } else {
              return snapshot.hasData
                  ? Container(
                      padding: EdgeInsets.all(8),
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int i) {
                            return InkWell(
                              onTap: () {},
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
                                          if (role == '2') ...{
                                            IconButton(
                                                onPressed: () {
                                                  deleteEvent(snapshot.data![i].id!);
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                )),
                                          }
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
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tanggal Mulai'),
                                          Text(Config.formatDateTime(snapshot.data![i].startEvent!.toString())),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tanggal Selesai'),
                                          Text(Config.formatDateTime(snapshot.data![i].endEvent!.toString())),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))
                  : Center(
                      child: Text('Tidak ada event dosen'),
                    );
            }
          }
        },
      ),
    );
  }
}
