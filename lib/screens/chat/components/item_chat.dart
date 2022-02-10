// ignore_for_file: must_be_immutable

import 'package:appointment/screens/chat_view/chat_view_screens.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class ItemChat extends StatelessWidget {
  ItemChat({
    Key? key,
    required this.data,
  }) : super(key: key);
  Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.pushNamed(
      //   context,
      //   ChatViewScreens.routeName,
      //   arguments: DetailsArguments(
      //     id: data['id_user'],
      //     product: data['id'],
      //   ),
      // ),
      child: SizedBox(
        width: SizeConfig.screenWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10), horizontal: getProportionateScreenWidth(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //   CircleAvatar(
                  //     backgroundImage: data == null
                  //         ? NetworkImage(
                  //             "http://192.168.0.106/Appointmentjti-1/assets/img/profile/default.png")
                  //         : NetworkImage(
                  //             "http://192.168.0.106/Appointmentjti-1/assets/img/profile/" +
                  //                 data['image']),
                  //   ),
                  // SizedBox(width: getProportionateScreenWidth(20)),
                  Text.rich(
                    TextSpan(
                      text: "${data['name']}\n",
                      style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "${data['topic']}",
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "${data['update_time']}",
                style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
