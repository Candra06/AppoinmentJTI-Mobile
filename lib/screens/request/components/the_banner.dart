// ignore_for_file: must_be_immutable

import 'package:appointment/service/sercive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class TheBanner extends StatelessWidget {
  TheBanner({
    Key? key,
    required this.data,
  }) : super(key: key);
  Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    var _data = Provider.of<ServiceProvider>(context, listen: false);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(5)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: data['status'] == 'waiting' ? kPrimaryColor : Colors.redAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: getProportionateScreenWidth(20)),
              Text.rich(
                TextSpan(
                  text: "${data['title']}\n",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: data['start_event'] == null
                          ? ""
                          : data['start_event'] + " - " + data['end_event'] ==
                                  null
                              ? ""
                              : data['end_event'],
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Column(
            children: [
              InkWell(
                onTap: () => _data.putJadwal(id: data['id'], status: 'accept'),
                onDoubleTap: () =>
                    _data.putJadwal(id: data['id'], status: 'reject'),
                child: Container(
                  decoration: BoxDecoration(
                    color: data['status'] == 'waiting'
                        ? Colors.blueGrey
                        : kPrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(10),
                      horizontal: getProportionateScreenWidth(15)),
                  child: Text(
                    data['status'] == null ? "" : data['status'],
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
