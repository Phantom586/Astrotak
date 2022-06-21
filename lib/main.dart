import 'package:astrotak/presentation/screens/profile/profile.dart';
import 'package:astrotak/presentation/screens/bottom_nav_bar.dart';
import 'package:astrotak/presentation/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const BottomNavBar(),
        '/profile': (context) => const MyProfile()
      },
    );
  }
}
