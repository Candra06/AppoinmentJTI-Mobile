import 'package:appointment/screens/chat_view/chat_view_screens.dart';
import 'package:appointment/screens/chat_view/listTopik.dart';
import 'package:appointment/screens/home/components/body.dart';
import 'package:appointment/screens/jadwal/event_dosen.dart';
import 'package:appointment/screens/jadwal/event_screen.dart';
import 'package:appointment/screens/profil/profil_screen.dart';
import 'package:flutter/material.dart';

class MainScreenMahasiswa extends StatefulWidget {
  static String routeName = "/home_nav";
  const MainScreenMahasiswa({Key? key}) : super(key: key);

  @override
  State<MainScreenMahasiswa> createState() => _MainScreenMahasiswaState();
}

class _MainScreenMahasiswaState extends State<MainScreenMahasiswa> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeBodyMahasiswa(),
    EventScreenDosen(),
    ListTopicScreen(),
    ProfileScreen(),
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
            label: 'Jadwal Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Event Dosen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
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
    );
  }
}
