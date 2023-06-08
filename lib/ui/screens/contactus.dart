import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  ContactUsScreenState createState() => ContactUsScreenState();
}

class ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _sendWhatsAppMessage() async {
    String name = nameController.text;
    String email = emailController.text;
    String message = messageController.text;

    String messageUrl =
        'https://api.whatsapp.com/send?phone=01020732368&text=Name: $name%0AEmail: $email%0AMessage: $message';

    // TODO : Don't use deprecated functions see the package official doc for updates.
    if (await canLaunch(messageUrl)) {
      // TODO : Don't use deprecated functions see the package official doc for updates.
      await launch(messageUrl);
    } else {
      throw 'Could not launch $messageUrl';
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _sendWhatsAppMessage();
      nameController.clear();
      emailController.clear();
      messageController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your message has been sent.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: messageController,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                maxLength: 500,
                decoration: const InputDecoration(
                  labelText: 'Message',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your message';
                  }
                  if (value.length > 500) {
                    return 'Your message cannot exceed 500 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Send'),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.language),
                    onPressed: () {
                      // TODO : Don't use deprecated functions see the package official doc for updates.
                      launch('https://www.rootsoft.dev');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
