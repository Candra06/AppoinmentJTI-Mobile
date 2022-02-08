import 'package:appointment/screens/event/event_screen.dart';
import 'package:appointment/screens/home/home_screen.dart';
import 'package:appointment/screens/jadwal/event_screen.dart';
import 'package:appointment/screens/profil/profil_screen.dart';
import 'package:appointment/screens/user_view/user_view_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../enums.dart';

class CostumeBottomNavigationBar extends StatelessWidget {
  const CostumeBottomNavigationBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => MenuState.home != selectedMenu ? Navigator.pushReplacementNamed(context, HomeScreen.routeName) : null,
              icon: Icon(
                Icons.calendar_today_rounded,
                color: MenuState.home == selectedMenu ? kPrimaryColor : inActiveIconColor,
              ),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.explore),
            // ),
            // IconButton(
            //   onPressed: () => MenuState.event != selectedMenu ? Navigator.pushReplacementNamed(context, EventScreenDosen.routeName) : null,
            //   icon: Icon(
            //     Icons.groups_outlined,
            //     color: MenuState.event == selectedMenu ? kPrimaryColor : inActiveIconColor,
            //   ),
            // ),
            IconButton(
              onPressed: () => MenuState.profile != selectedMenu ? Navigator.pushReplacementNamed(context, ProfilScreen.routeName) : null,
              icon: Icon(
                Icons.person_outline,
                color: MenuState.profile == selectedMenu ? kPrimaryColor : inActiveIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
