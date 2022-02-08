import 'package:appointment/screens/home/components/body.dart';
import 'package:appointment/screens/jadwal/event_dosen.dart';
import 'package:appointment/screens/jadwal/event_screen.dart';
import 'package:appointment/screens/master/dosen/listDosen.dart';
import 'package:appointment/screens/master/mahasiswa/listMahasiswa.dart';
import 'package:appointment/screens/master/prodi/prodi.dart';
import 'package:flutter/material.dart';

class MainScreenAdmin extends StatefulWidget {
  static String routeName = "/home_nav";
  const MainScreenAdmin({Key? key}) : super(key: key);

  @override
  State<MainScreenAdmin> createState() => _MainScreenAdminState();
}

class _MainScreenAdminState extends State<MainScreenAdmin> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ListDosen(),
    ListMahasiswa(),
    ListProdi(),
    HomeBodyMahasiswa(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Dosen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
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
        fixedColor: Colors.grey[450],
        unselectedItemColor: Colors.grey[450],
        selectedItemColor: Colors.blue[900],
        onTap: _onItemTapped,
      ),
    );
  }
}
