import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/logo2.png'),
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.cyan,
                Colors.cyan,
                Colors.cyan,
              ],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    scale: 2.5,
                    image: AssetImage(
                      "images/logo2.png",
                    ),
                  ),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.home, color: Colors.white),
                title: Text(
                  'الصفحة الرئيسية',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                  textDirection: TextDirection.rtl,
                ),
              ),
              ListTile(
                trailing: Icon(Icons.call, color: Colors.white),
                title: Text(
                  'اتصل بنا',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 430,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'الإصدار 1.0.0 ',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Column(
                children: [
                  Image.asset(
                    'images/root.png',
                    scale: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "www.rootsoft.dev",
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
            color: Colors.white),
        selectedLabelStyle: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.white),
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
