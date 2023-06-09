import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  scale: 2.5,
                  image: AssetImage(
                    "images/logo2.png",
                  ),
                ),
              ),
              child: Text(''),
            ),
            // TODO : Make this pop to home screen on click
            const ListTile(
              trailing: Icon(Icons.home, color: Colors.white),
              title: Text(
                'الصفحة الرئيسية',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
                textDirection: TextDirection.rtl,
              ),
            ),
            ListTile(
              trailing: const Icon(Icons.call, color: Colors.white),
              title: const Text(
                'اتصل بنا',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                textDirection: TextDirection.rtl,
              ),
              onTap: () {
                Navigator.of(context).pushNamed("/contact");
              },
            ),
            const SizedBox(
              height: 430,
            ),
            const ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الإصدار 1.0.0 ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Column(
              children: [
                Image.asset(
                  'images/root.png',
                  scale: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "www.rootsoft.dev",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
