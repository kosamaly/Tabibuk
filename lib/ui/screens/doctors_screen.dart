import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tabibuk/helpers/context_extensions.dart';
import 'package:tabibuk/ui/widgets/doctors_list.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Home', textDirection: TextDirection.rtl),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 32.0,
                  left: 2.0,
                ),
                // child: Directionality(
                //   textDirection: TextDirection.rtl,
                //   child: BackButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     color: Colors.black,
                //   ),
                // ),
              ),
              Container(
                width: context.widthR(0.6),
                height: context.heightR(0.20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/logo2.png'),
                  ),
                ),
              ),
              const DoctorsList(),
              SizedBox(
                height: context.heightR(0.12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
