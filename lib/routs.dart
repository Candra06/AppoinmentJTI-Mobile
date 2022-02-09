import 'package:appointment/screens/chat/chat_screens.dart';
import 'package:appointment/screens/chat_view/chat_view_screens.dart';
import 'package:appointment/screens/details/details_screen.dart';
import 'package:appointment/screens/event/event_screen.dart';
import 'package:appointment/screens/home/home_screen.dart';
import 'package:appointment/screens/home/main_screen_admin.dart';
import 'package:appointment/screens/home/main_screen_dosen.dart';
import 'package:appointment/screens/home/main_screen_mahasiswa.dart';
import 'package:appointment/screens/jadwal/components/detail_jadwal.dart';
import 'package:appointment/screens/jadwal/jadwal_screen.dart';
import 'package:appointment/screens/master/dosen/addDosen.dart';
import 'package:appointment/screens/master/dosen/detailDosen.dart';
import 'package:appointment/screens/master/mahasiswa/addMahasiswa.dart';
import 'package:appointment/screens/master/mahasiswa/detailMahasiswa.dart';
import 'package:appointment/screens/profil/profil_screen.dart';
import 'package:appointment/screens/request/request_screen.dart';
import 'package:appointment/screens/setting_ip/setting_ip_screens.dart';
import 'package:appointment/screens/sign_in/sign_in_screen.dart';
import 'package:appointment/screens/splash/splash_screens.dart';
import 'package:appointment/screens/user_view/user_view_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String LOGIN = '/login';
  static const String JADWAL_DOSEN = '/jadwal_dosen';
  static const String HOME_MAHASISWA = '/home_mahasiswa';
  static const String HOME_DOSEN = '/home_dosen';
  static const String HOME_ADMIN = '/home_admin';
  static const String DETAIL_JADWAL = '/detail_jadwal';
  static const String DETAIL_DOSEN = '/detail_dosen';
  static const String DETAIL_MAHASISWA = '/detail_mahasiswa';
  static const String ADD_MAHASISWA = '/add_mahasiswa';
  static const String ADD_DOSEN = '/add_dosen';

  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case JADWAL_DOSEN:
        return MaterialPageRoute(
            builder: (_) => JadwalScreen(
                  data: settings.arguments.toString(),
                ));
      case LOGIN:
        return MaterialPageRoute(
            builder: (_) => SignInScreen(
                // data: settings.arguments.toString(),
                ));
      case HOME_MAHASISWA:
        return MaterialPageRoute(
            builder: (_) => MainScreenMahasiswa(
                // data: settings.arguments.toString(),
                ));
      case HOME_DOSEN:
        return MaterialPageRoute(
            builder: (_) => MainScreenMahasiswa(
                // data: settings.arguments.toString(),
                ));
      case HOME_ADMIN:
        return MaterialPageRoute(
            builder: (_) => MainScreenAdmin(
                // data: settings.arguments.toString(),
                ));
      case DETAIL_JADWAL:
        return MaterialPageRoute(
            builder: (_) => DetailJadwal(
                  id: settings.arguments.toString(),
                  // data: settings.arguments.toString(),
                ));
      case ADD_MAHASISWA:
        return MaterialPageRoute(
            builder: (_) => FormMahasiswa(
                // data: settings.arguments.toString(),
                ));
      case ADD_DOSEN:
        return MaterialPageRoute(
            builder: (_) => FormDosen(
                // data: settings.arguments.toString(),
                ));
      case DETAIL_DOSEN:
        return MaterialPageRoute(
            builder: (_) => DetailDosen(
                  id: settings.arguments.toString(),
                ));
      case DETAIL_MAHASISWA:
        return MaterialPageRoute(
            builder: (_) => DetailMahasiswa(
                  id: settings.arguments.toString(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Page ${settings.name} not defined'),
                  ),
                ));
    }
  }
}

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SettingIpScreens.routeName: (context) => SettingIpScreens(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfilScreen.routeName: (context) => ProfilScreen(),
  RequestScreen.routeName: (context) => RequestScreen(),
  ChatScreens.routeName: (context) => ChatScreens(),
  ChatViewScreens.routeName: (context) => ChatViewScreens(),
  UserView.routeName: (context) => UserView(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  EventScreen.routeName: (context) => EventScreen(),
  // EventScreenDosen.routeName: (context) => EventScreenDosen(),
  'jadwal_screen': (context) => JadwalScreen(),
};
