// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:appointment/components/social_card.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'jadwal_form.dart';

class JadwalBody extends StatelessWidget {
  const JadwalBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16), // 4%
                Text(
                  "Selesaikan detail mu atau kembali degan tombol kembali",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 16),
                JadwalForm(
                    // product: product,
                    ),
                SizedBox(height: SizeConfig.screenHeight! * 0.04),
                Text(
                  'Untuk menyimpan click simpan jika kamu sudah selesai',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocialCard(
                //       icon: Icons.g_mobiledata_outlined,
                //       press: () {},
                //     ),
                //     SocialCard(
                //       icon: Icons.facebook_outlined,
                //       press: () {},
                //     ),
                //     SocialCard(
                //       icon: Icons.settings_outlined,
                //       press: () {},
                //     ),
                //   ],
                // ),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
