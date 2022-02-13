import 'dart:io';

import 'package:appointment/screens/home/components/body.dart';
import 'package:appointment/screens/master/dosen/listDosen.dart';
import 'package:appointment/screens/master/mahasiswa/listMahasiswa.dart';
import 'package:appointment/screens/master/prodi/prodi.dart';
import 'package:appointment/screens/profil/profil_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreenAdmin extends StatefulWidget {
  static String routeName = "/home_nav";
  const MainScreenAdmin({Key? key}) : super(key: key);

  @override
  State<MainScreenAdmin> createState() => _MainScreenAdminState();
}

class _MainScreenAdminState extends State<MainScreenAdmin> {
  int _selectedIndex = 0;

   Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    ListDosen(),
    ListMahasiswa(),
    ListProdi(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chalkboardTeacher),
              label: 'Dosen',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.graduationCap),
              label: 'Mahasiswa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_rounded),
              label: 'Jurusan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          // fixedColor: Colors.grey[450],
          unselectedItemColor: Colors.black54,
    
          selectedItemColor: Colors.blue[900],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
