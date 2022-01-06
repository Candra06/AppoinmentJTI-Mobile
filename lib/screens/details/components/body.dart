import 'package:appointment/screens/jadwal/jadwal_screen.dart';
import 'package:flutter/material.dart';
import 'package:appointment/components/befault_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../size_config.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final dynamic product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _idrole = "";

  @override
  void initState() {
    super.initState();
    getFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product['image']),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    // ColorDots(product: product),
                    _idrole == '3'
                        ? TopRoundedContainer(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfig.screenWidth! * 0.15,
                                right: SizeConfig.screenWidth! * 0.15,
                                bottom: getProportionateScreenWidth(40),
                                top: getProportionateScreenWidth(15),
                              ),
                              child: DefaultButton(
                                text: "Buat Jadwal",
                                press: () => Navigator.pushNamed(
                                  context,
                                  JadwalScreen.routeName,
                                  arguments: DetailsArguments(
                                    product: widget.product['id_user'],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _idrole = prefs.getString('id_role')!;
    });
  }
}
