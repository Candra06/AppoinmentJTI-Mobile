// ignore_for_file: implementation_imports
import 'package:appointment/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _email = "";
  String _idrole = "";
  String _image = "";

  @override
  void initState() {
    super.initState();
    getFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ProfilePic(
            image: _image,
          ),
          const SizedBox(height: 20),
          ProfileMenu(
            icon: Icons.person_outline,
            text: _email,
            press: () {},
            sufixIcon: false,
          ),
          ProfileMenu(
            icon: Icons.person_pin_outlined,
            // ignore: unrelated_type_equality_checks
            text: (_idrole == '1')
                ? 'Admin'
                // ignore: unrelated_type_equality_checks
                : (_idrole == '2')
                    ? 'Dosen'
                    : 'Mahasiswa',
            press: () {},
            sufixIcon: false,
          ),
          // ProfileMenu(
          //   icon: Icons.settings,
          //   text: 'Setting',
          //   press: () {},
          // ),
          // ProfileMenu(
          //   icon: Icons.question_answer_outlined,
          //   text: 'Help Center',
          //   press: () {},
          // ),
          ProfileMenu(
            icon: Icons.logout,
            text: 'Log Out',
            press: () {
              getLogOut();
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  void getLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove("email");
      prefs.remove("id_role");
      prefs.remove("image");
    });
  }

  void getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _email = prefs.getString("email")!;
      _idrole = prefs.getString("id_role")!;
      _image = prefs.getString("image")!;
    });
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
    this.sufixIcon = true,
  }) : super(key: key);
  final bool sufixIcon;
  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(20),
          primary: const Color(0xFFF5F6F9),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: kPrimaryColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            if (sufixIcon) const Icon(Icons.arrow_forward_ios_outlined),
          ],
        ),
      ),
    );
  }
}
