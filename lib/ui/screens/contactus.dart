import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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

    if (await canLaunch(messageUrl)) {
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
        SnackBar(
          content: Text('Your message has been sent.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
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
                decoration: InputDecoration(
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
                decoration: InputDecoration(
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
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Send'),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.language),
                    onPressed: () {
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
