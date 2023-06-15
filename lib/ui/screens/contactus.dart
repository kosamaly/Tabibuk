import 'package:flutter/material.dart';
import 'package:tabibuk/configs/themes/dimensions.dart';
import 'package:tabibuk/helpers/context_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  ContactScreenState createState() => ContactScreenState();
}

class ContactScreenState extends State<ContactScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _launchWhatsApp() async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();

    String message = _messageController.text.trim();
    if (message.length > 500) {
      message = message.substring(0, 500);
    }

    final Uri url = Uri.parse(
        // NEW
        'https://wa.me/+201020732368?text=name:%20$name%0aemail:%20$email%0amessage:%20$message'
        // OLD
        // 'https://api.whatsapp.com/send?phone=01064959756&text=name:%20$name%0aemail:%20$email%0amessage:%20$message'
        );

    //  final int x = int.parse("5");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchWebsite() async {
    final Uri url = Uri.parse('https://www.rootsoft.dev');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.cyan, Colors.cyanAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(D.size3XLarge),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.all(D.size3XLarge),
                  child: Text(
                    "اتصل بنا",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        labelText: 'الاسم',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                  ),
                ),
                const SizedBox(height: 16),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        labelText: 'البريد الالكتروني',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        )),
                  ),
                ),
                const SizedBox(height: D.sizeLarge),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _messageController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'اكتب رسالتك',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    maxLength: 500,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.unFocusRequest();
                    _launchWhatsApp();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.cyan),
                  ),
                  child: const Text(
                    'أرسل',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "البريد الإلكتروني",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 8),
                const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "hi@Tabeebuk.com",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "العنوان",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 8,
                ),
                const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "جسر الملك عبد العزيز الرياض    المملكه العربيه السعوديه",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: _launchWebsite,
                        icon: const Icon(Icons.public,
                            color: Colors.white, size: 40)),
                    IconButton(
                      onPressed: _launchWebsite,
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: _launchWebsite,
                      icon: const FaIcon(FontAwesomeIcons.instagram,
                          color: Colors.white, size: 40),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
