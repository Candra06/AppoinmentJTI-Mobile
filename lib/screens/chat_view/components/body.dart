import 'package:appointment/models/replyModel.dart';
import 'package:appointment/models/topicModel.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/service/user_repository.dart';
import 'package:appointment/size_config.dart';
import 'package:appointment/utill/preference.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  // final String product;
  final String? id;

  const Body({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? idUser;
  Future<List<TopicModel>>? listTopic;
  Future<List<ReplyModel>>? listReply;
  TextEditingController txtPesan = new TextEditingController();
  bool load = true;
  UserRepository repository = new UserRepository();

  void getData() async {
    String tmp = await Pref.getIDUser();
    setState(() {
      idUser = tmp;
      load = true;
    });

    listReply = repository.detailChat(widget.id!.toString());
    setState(() {
      load = false;
    });
  }

  void replyChat(String user, String idChat, String message) async {
    ReplyModel model = new ReplyModel();

    model.idChat = idChat;
    model.idUser = user;
    model.message = message;
    Map<String, dynamic>? respon = await repository.replyChat(model);
    if (respon!['status'] == true) {
      txtPesan.text = '';
      getData();
    } else {
      Config.alert(0, respon['message']);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
            top: 0,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: FutureBuilder<List<ReplyModel>>(
              future: listReply,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return snapshot.hasData
                      ? ListChat(
                          data: snapshot.data!,
                          idUser: idUser,
                        )
                      : Container();
                }
              },
            )),
        Positioned(
          top: 0,
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Center(
            child: Text(""),
          ),
        ),
        Positioned(
          bottom: 0,
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenWidth! / 4.5,
          child: Container(
            margin: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextField(
              controller: txtPesan,
              onChanged: (value) {},
              onSubmitted: (value) {
                replyChat(idUser!, widget.id!, value);
              },
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Apa yang anda pikirkan",
                // prefixIcon: const Icon(Icons.search_outlined),
                suffixIcon: IconButton(
                    onPressed: () {
                      replyChat(idUser!, widget.id!, txtPesan.text);
                    },
                    icon: const Icon(Icons.arrow_forward_ios_outlined)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ListChat extends StatelessWidget {
  ListChat({
    Key? key,
    required this.data,
    required this.idUser,
  }) : super(key: key);
  final List<ReplyModel> data;
  final String? idUser;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(color: data[index].fromBy == idUser ? Colors.blueAccent : Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(
                    // data[index].me,
                    data[index].message!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                      color: data[index].fromBy == idUser ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w100,
                    ),
                  )),
                  SizedBox(width: getProportionateScreenWidth(25)),
                  Text(
                    Config.formatDateChat(data[index].updateTime.toString()),
                    style: TextStyle(
                      fontSize: 12,
                      color: data[index].fromBy == idUser ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
