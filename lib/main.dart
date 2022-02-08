import 'package:appointment/routs.dart';
import 'package:appointment/screens/home/home_screen.dart';
import 'package:appointment/screens/sign_in/sign_in_screen.dart';
import 'package:appointment/service/sercive_provider.dart';
import 'package:appointment/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServiceProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeData(),
        // home: const SplashScreen(),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: Routes.HOME_MAHASISWA,
        routes: routes,
      ),
    );
  }
}
