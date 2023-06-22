import 'package:flutter/material.dart';
import 'package:tabibuk/configs/themes/dimensions.dart';
import 'package:tabibuk/helpers/context_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _nameError = false;
  bool _emailError = false;
  bool _messageError = false;

  void _launchWhatsApp() async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    String message = _messageController.text.trim();

    if (message.length > 500) {
      message = message.substring(0, 500);
    }

    final Uri url = Uri.parse(
      'https://wa.me/+201020732368?text=name:%20$name%0aemail:%20$email%0amessage:%20$message',
    );

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

  void _validateFields() {
    setState(() {
      _nameError = _nameController.text.isEmpty;
      _emailError = !_validateEmail(_emailController.text);
      _messageError = _messageController.text.isEmpty;
    });

    if (!_nameError && !_emailError && !_messageError) {
      _launchWhatsApp();
    }
  }

  bool _validateEmail(String email) {
    final emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$',
      caseSensitive: false,
    );
    return emailRegExp.hasMatch(email);
  }

//request Unfocuce
  void unFocusRequest() {
    final currentFocus = FocusScope.of(this as BuildContext);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
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
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 32.0,
                    left: 2.0,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: Text(
                    "اتصل بنا",
                    style: TextStyle(
                      fontSize: 27.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'الاسم',
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 16.0),
                      icon: Icon(Icons.person, color: Colors.white),
                      errorText: _nameError ? 'الرجاء إدخال الاسم' : null,
                    ),
                  ),
                ),
                const SizedBox(height: D.size3XLarge),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'البريد الإلكتروني',
                      labelStyle:
                          TextStyle(color: Colors.white, fontSize: 16.0),
                      icon: Icon(Icons.email, color: Colors.white),
                      errorText: _emailError
                          ? 'الرجاء إدخال بريد إلكتروني صحيح'
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: D.sizeXLarge),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _messageController,
                    maxLength: 500,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'اكتب رسالتك',
                      labelStyle:
                          TextStyle(color: Colors.white, fontSize: 16.0),
                      errorText: _messageError ? 'الرجاء إدخال الرسالة' : null,
                    ),
                  ),
                ),
                SizedBox(height: D.sizeLarge),
                ElevatedButton(
                  onPressed: () {
                    _validateFields();
                    context.unFocusRequest();
                    // _launchWhatsApp();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.cyan),
                  ),
                  child: const Text(
                    'أرسل',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: D.sizeXLarge),
                const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "البريد الإلكتروني",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 8),
                const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "hi@Tabeebuk.com",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                const SizedBox(
                  height: D.sizeXLarge,
                ),
                const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "العنوان",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: D.sizeLarge,
                ),
                const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "جسر الملك عبد العزيز الرياض المملكه العربيه السعوديه",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                const SizedBox(height: D.size3XLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: _launchWebsite,
                        icon: const Icon(Icons.public,
                            color: Colors.white, size: 32)),
                    IconButton(
                      onPressed: _launchWebsite,
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: _launchWebsite,
                      icon: const FaIcon(FontAwesomeIcons.instagram,
                          color: Colors.white, size: 32),
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
