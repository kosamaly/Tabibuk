import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibuk/helpers/ui_helpers.dart';
import 'package:tabibuk/logic/providers/doctors_provider.dart';

import 'doctors_card.dart';

class DoctorsList extends StatefulWidget {
  final String categoryId;
  const DoctorsList({super.key, required this.categoryId});

  @override
  DoctorsListState createState() => DoctorsListState();
}

class DoctorsListState extends State<DoctorsList> {
  @override
  void initState() {
    super.initState();
    UiHelper.postBuild((_) {
      context.read<DoctorsProvider>().fetchDoctors();
    });
  }

  @override
  Widget build(BuildContext context) {
    final doctorsProvider = context.watch<DoctorsProvider>();
    final isLoading = doctorsProvider.isLoading;
    final isError = doctorsProvider.isError;
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (isError) {
      return const Text(
        "حدث خطأ ما",
        style: TextStyle(fontSize: 15, color: Colors.red),
      );
    } else {
      return SizedBox(
          child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: doctorsProvider.doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctorsProvider.doctors[index];
          return Padding(
            padding: const EdgeInsets.only(
                right: 8,
                left: 8,
                bottom: 5,
                top: 5), // Add desired spacing between cards here
            child: SizedBox(
              width: 150, // Set the desired width
              // Set the desired height
              child: DoctorCard(
                  doctor:
                      doctor), // Replace CategoryCard with your custom widget
            ),
          );
        },
      ));
    }
  }
}
