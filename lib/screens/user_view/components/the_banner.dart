// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:appointment/screens/details/details_screen.dart';
import 'package:appointment/service/sercive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../../size_config.dart';

class TheBanner extends StatelessWidget {
  TheBanner({
    Key? key,
    required this.data,
    required this.colors,
    required this.press,
  }) : super(key: key);
  Map<String, dynamic> data;
  final Color colors;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        DetailsScreen.routeName,
        arguments: ProductDetailsArguments(
          product: data,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(5)),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(15)),
        width: double.infinity,
        decoration: BoxDecoration(
          color: (data['id_prodi'] == "1")
              ? colors
              : (data['id_prodi'] == "2")
                  ? Colors.blueGrey
                  : Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: data['image'] == null
                      ? null
                      : NetworkImage(
                          context.watch<ServiceProvider>().imageUrl.toString() +
                              data['image']),
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
                Text.rich(
                  TextSpan(
                    text: "${data['name']}\n",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: data['email'],
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(width: getProportionateScreenWidth(20)),
            Text(
              (data['id_prodi'] == "1")
                  ? "MIF"
                  : (data['id_prodi'] == "2")
                      ? "TIF"
                      : "TKK",
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
