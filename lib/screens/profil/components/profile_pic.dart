// ignore_for_file: unnecessary_null_comparison

import 'package:appointment/service/sercive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: image == null
                ? null
                : NetworkImage(context.watch<ServiceProvider>().imageUrl.toString() + image == null
                    ? 'https://appointmentjti.waserdajaya.store/assets/img/profile/' + "default.png"
                    : 'https://appointmentjti.waserdajaya.store/assets/img/profile/' + image),
          ),
          Positioned(
            right: -10,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.blueGrey[600],
                ),
                style: ElevatedButton.styleFrom(
                  elevation: .5,
                  primary: Colors.white,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
