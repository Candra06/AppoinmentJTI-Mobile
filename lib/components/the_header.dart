import 'package:appointment/screens/chat/chat_screens.dart';
import 'package:appointment/screens/request/components/icon_btn_with_counter.dart';
import 'package:appointment/components/search_field.dart';
import 'package:appointment/screens/request/request_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enums.dart';
import '../size_config.dart';

class TheHeader extends StatefulWidget {
  const TheHeader({
    Key? key,
    this.userSearchField = false,
    this.titel = "",
  }) : super(key: key);
  final bool userSearchField;
  final String titel;

  @override
  State<TheHeader> createState() => _TheHeaderState();
}

class _TheHeaderState extends State<TheHeader> {
  String _idrole = "";

  @override
  void initState() {
    super.initState();
    getFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          (widget.userSearchField != true)
              ? SizedBox(
                  width: getProportionateScreenWidth(150),
                  child: Text(
                    widget.titel,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              : const SearchField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBtnWithCounter(
                svgSrc: Icons.chat_bubble_outline,
                press: () => MenuState.profile != ChatScreens.routeName
                    ? Navigator.pushNamed(context, ChatScreens.routeName)
                    : null,
              ),
              (_idrole == '2')
                  ? IconBtnWithCounter(
                      svgSrc: Icons.date_range_outlined,
                      press: () => MenuState.profile != RequestScreen.routeName
                          ? Navigator.pushNamed(
                              context, RequestScreen.routeName)
                          : null,
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  void getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _idrole = prefs.getString('id_role')!;
    });
  }
}
