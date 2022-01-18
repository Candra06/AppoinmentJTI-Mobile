import 'package:appointment/service/sercive_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'item_chat.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: FutureBuilder(
          future: Provider.of<ServiceProvider>(context, listen: false).getChat(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LinearProgressIndicator();
            } else {
              return Consumer<ServiceProvider>(builder: (context, data, _) {
                return ListView.builder(
                    itemCount: data.data.length,
                    itemBuilder: (BuildContext context, i) {
                      return ItemChat(
                        data: data.data[i],
                      );
                    });
              });
              // SingleChildScrollView(
              //   physics: const BouncingScrollPhysics(),
              //   child: (context.watch<ServiceProvider>().isNull != true)
              //       ? Column(
              //           children: [
              //             SizedBox(height: getProportionateScreenWidth(50)),
              //             ...List.generate(
              //                 context.watch<ServiceProvider>().data.length,
              //                 (index) => ItemChat(
              //                       data: context.watch<ServiceProvider>().data[index],
              //                     )),
              //           ],
              //         )
              //       : Center(child: const CircularProgressIndicator()),
              // );
            }
          },
        ));
  }
}
