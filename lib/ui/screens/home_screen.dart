import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tabibuk/helpers/context_extensions.dart';
import 'package:tabibuk/ui/screens/drawer.dart';
import 'package:tabibuk/ui/widgets/categories_list.dart';
import 'package:tabibuk/ui/widgets/doctors_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("Home Rebuild");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Container(
              width: context.widthR(0.6),
              height: context.heightR(0.20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/logo2.png'),
                ),
              ),
            ),
            const CategoriesList(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: context.heightR(0.12),
            ),
            Text(
              "وَإِذَا مَرِضْتُ فَهُوَ يَشْفِيْنِ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.cyan),
            ),
          ],
        ),
      ),
      endDrawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
          color: Colors.white,
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.white,
        ),
        backgroundColor: Colors.cyan,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'الاشعارات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'حجوزاتي',
          ),
        ],
      ),
    );
  }
}
