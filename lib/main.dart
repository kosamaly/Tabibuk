import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibuk/ui/screens/contactus.dart';
import 'package:tabibuk/ui/screens/doctors_screen.dart';
import 'package:tabibuk/ui/screens/home_screen.dart';
import 'package:tabibuk/ui/screens/splash_screen.dart';

import 'data/models/category_model.dart';
import 'logic/providers/categories_provider.dart';
import 'logic/providers/doctors_provider.dart';
import 'logic/providers/selected_categoy_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const categoryId = 1; // replace with the actual categoryId value

    return MultiProvider(
      providers: [
        // provide CategoriesProvider here
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => DoctorsProvider()),
        ChangeNotifierProvider(create: (_) => SelectedCategoryProvider()),
        // add more providers if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "cairo",
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => HomeScreen(
              categoryId: categoryId,
              category:
                  CategoryModel(categoryId: categoryId, name: '', image: '')),
          '/contact': (context) => const ContactScreen(),
        },
      ),
    );
  }
}
