import 'package:flutter/material.dart';
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
    final String message = _messageController.text.trim().substring(0, 500);
    final String url = Uri.parse(
            'https://api.whatsapp.com/send?phone=01064959756&text=name:%20$name%0aemail:%20$email%0amessage:%20$message')
        as String;
    if (await launchUrl(Uri.parse as Uri)) {
      await launchUrl(Uri.parse as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchWebsite() async {
    const String url = 'https://www.rootsoft.dev';
    if (await canLaunchUrl(Uri.parse as Uri)) {
      await launchUrl(Uri.parse as Uri);
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.cyan, Colors.cyanAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.all(36),
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
                const SizedBox(height: 16),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _messageController,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'Message (max 500 characters)',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _launchWhatsApp,
                  child: const Text(
                    'أرسل',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.cyan),
                  ),
                ),
                SizedBox(height: 30),
                Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "البريد الإلكتروني",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 8),
                Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "hi@Tabeebuk.com",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                SizedBox(
                  height: 20,
                ),
                Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "العنوان",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 8,
                ),
                Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "جسر الملك عبد العزيز الرياض    المملكه العربيه السعوديه",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                SizedBox(height: 80),
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
