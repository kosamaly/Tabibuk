import 'package:flutter/material.dart';
import 'package:tabibuk/ui/screens/contactus.dart';

import 'package:tabibuk/ui/screens/home_screen.dart';
import 'package:tabibuk/ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/contact': (context) => ContactUsScreen(),
      },
    );
  }
}
