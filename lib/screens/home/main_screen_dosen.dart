import 'package:appointment/screens/home/components/body.dart';
import 'package:appointment/screens/jadwal/event_dosen.dart';
import 'package:appointment/screens/jadwal/event_screen.dart';
import 'package:flutter/material.dart';

class MainScreenDosen extends StatefulWidget {
  static String routeName = "/home_nav";
  const MainScreenDosen({Key? key}) : super(key: key);

  @override
  State<MainScreenDosen> createState() => _MainScreenDosenState();
}

class _MainScreenDosenState extends State<MainScreenDosen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    EventScreenDosen(),
    HomeBodyMahasiswa(),
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
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Jadwal Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Pengajuan Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[900],
        onTap: _onItemTapped,
      ),
    );
  }
}
