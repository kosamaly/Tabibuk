import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tabibuk/helpers/context_extensions.dart';

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
            colors: [Colors.cyan, Colors.cyan, Colors.cyanAccent],
          ),
        ),
        child: ListView(
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
            ListTile(
              trailing: const Icon(Icons.home, color: Colors.white),
              title: const Text(
                'الصفحة الرئيسية',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
                textDirection: TextDirection.rtl,
              ),
              onTap: () {
                Navigator.pop(context);
              },
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
            SizedBox(
              height: context.heightR(0.35),
            ),
            FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final appVersion = snapshot.data!.version;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "الإصدار",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        appVersion,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
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
