import 'package:appointment/models/topicModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/chat_view/components/modal_add_topic.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/service/user_repository.dart';
import 'package:appointment/utill/preference.dart';
import 'package:flutter/material.dart';

class ListTopicScreen extends StatefulWidget {
  const ListTopicScreen({Key? key}) : super(key: key);

  @override
  _ListTopicScreenState createState() => _ListTopicScreenState();
}

class _ListTopicScreenState extends State<ListTopicScreen> {
  String? role;
  Future<List<TopicModel>>? listTopic;
  UserRepository repository = new UserRepository();
  bool load = true;
  void getData() async {
    String tmpRole = await Pref.getRole();
    setState(() {
      role = tmpRole;
      load = true;
    });
    String idUser = await Pref.getIDUser();
    listTopic = repository.listTopic(idUser);
    setState(() {
      load = false;
    });
  }

  void _addTopic() async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return ModalAddTopic();
        });
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
        actions: [
          if (role == '3') ...{
            IconButton(
                onPressed: () {
                  _addTopic();
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ))
          }
        ],
        title: Text(
          'Topik Chat',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<TopicModel>>(
        future: listTopic,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          } else {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text('Tidak topik chat'),
              );
            } else {
              return snapshot.hasData
                  ? Container(
                      padding: EdgeInsets.all(8),
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int i) {
                            print(snapshot.data![i]);
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.DETAIL_CHAT, arguments: snapshot.data![i].id);
                              },
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshot.data![i].name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                          Text(Config.formatDateChat(snapshot.data![i].updateTime!.toString())),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Text('Tanggal Mulai'),
                                          Text(snapshot.data![i].topic!),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))
                  : Center(
                      child: Text('Belum ada topic chat'),
                    );
            }
          }
        },
      ),
    );
  }
}
