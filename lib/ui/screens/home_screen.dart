import 'package:flutter/material.dart';
import 'package:tabibuk/configs/themes/dimensions.dart';
import 'package:tabibuk/data/models/category_model.dart';
import 'package:tabibuk/helpers/context_extensions.dart';
import 'package:tabibuk/ui/screens/drawer.dart';
import 'package:tabibuk/ui/widgets/categories_list.dart';
import 'package:tabibuk/ui/widgets/doctors_list.dart';

class HomeScreen extends StatefulWidget {
  final CategoryModel category;

  const HomeScreen({
    Key? key,
    required int categoryId,
    required this.category,
  }) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90, // Preferred height of the appbar
        title: Container(
          padding: const EdgeInsets.only(top: 8),
          child: Image.asset(
            'images/logo2.png',
            fit: BoxFit.contain,
            width: 250,
            height: 80,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),

        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),

      body: const Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: CategoriesList(),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: DoctorsList(),
            )),
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
// Container(
//   width: context.width * 0.6,
//   height: context.height * 0.11,
//   decoration: const BoxDecoration(
//     image: DecorationImage(
//       image: AssetImage('images/logo2.png'),
//     ),
//   ),
// ),
