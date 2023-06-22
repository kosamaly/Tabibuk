import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibuk/ui/screens/drawer.dart';
import '../../logic/providers/categories_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    final categories = categoriesProvider.categories;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logo2.png'),
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: categoriesProvider.fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.cyan,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  if (categories != null) {
                    // Added null check for 'categories'
                    return SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              return Row(
                                children: [
                                  ListTile(
                                    title: Text(
                                      category.name,
                                      style: const TextStyle(
                                        color: Colors.cyanAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }
              },
            )
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
