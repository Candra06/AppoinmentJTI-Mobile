import 'package:appointment/service/sercive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../../size_config.dart';
import 'the_banner.dart';

class HomeBodyAdmin extends StatelessWidget {
  const HomeBodyAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.watch<ServiceProvider>().getJumlah();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            TheBanner(
              textTite: "Mahasiswa",
              textValue: context.watch<ServiceProvider>().length['mahasiswa'].toString(),
              colors: Color(0xFF4A3298),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            TheBanner(
              textTite: "Dosen",
              textValue: context.watch<ServiceProvider>().length['dosen'].toString(),
              colors: Color(0xFF329837),
            ),
            // SizedBox(height: getProportionateScreenWidth(20)),
            // const TheBanner(
            //   textTite: "Request",
            //   textValue: "5",
            //   colors: Color(0xFF32988F),
            // ),
            SizedBox(height: getProportionateScreenWidth(20)),
            TheBanner(
              textTite: "Jadwal",
              textValue: context.watch<ServiceProvider>().length['jadwal'].toString(),
              colors: Color(0xFF969832),
            ),
          ],
        ),
      ),
    );
  }
}
