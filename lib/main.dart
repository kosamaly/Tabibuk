import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibuk/ui/screens/contactus.dart';

import 'package:tabibuk/ui/screens/home_screen.dart';
import 'package:tabibuk/ui/screens/splash_screen.dart';

import 'logic/providers/categories_provider.dart';
import 'ui/Categories_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provide CategoriesProvider here
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        // Add more providers if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "cairo",
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const HomeScreen(),
          '/contact': (context) => const ContactScreen(),
          '/category': (context) => CategoriesScreen(),
        },
      ),
    );
  }
}
