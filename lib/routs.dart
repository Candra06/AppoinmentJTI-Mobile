import 'package:appointment/screens/chat/chat_screens.dart';
import 'package:appointment/screens/chat_view/chat_view_screens.dart';
import 'package:appointment/screens/details/details_screen.dart';
import 'package:appointment/screens/event/event_screen.dart';
import 'package:appointment/screens/home/home_screen.dart';
import 'package:appointment/screens/jadwal/jadwal_screen.dart';
import 'package:appointment/screens/profil/profil_screen.dart';
import 'package:appointment/screens/request/request_screen.dart';
import 'package:appointment/screens/setting_ip/setting_ip_screens.dart';
import 'package:appointment/screens/sign_in/sign_in_screen.dart';
import 'package:appointment/screens/splash/splash_screens.dart';
import 'package:appointment/screens/user_view/user_view_screen.dart';
import 'package:flutter/widgets.dart';

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
  JadwalScreen.routeName: (context) => JadwalScreen(),
};
