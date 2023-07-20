import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibuk/helpers/context_extensions.dart';
import 'package:tabibuk/helpers/ui_helpers.dart';
import 'package:tabibuk/logic/providers/doctors_provider.dart';
import 'doctors_card.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  DoctorsListState createState() => DoctorsListState();
}

class DoctorsListState extends State<DoctorsList> {
  @override
  void initState() {
    super.initState();
    UiHelper.postBuild((_) async {
      await context.read<DoctorsProvider>().fetchDoctors();
    });
  }

  /// TODO FIX UI

  @override
  Widget build(BuildContext context) {
    final doctorsProvider = context.watch<DoctorsProvider>();
    final isLoading = doctorsProvider.isLoading;
    final isError = doctorsProvider.isError;

    if (isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 200),
          child: CircularProgressIndicator(),
        ),
      );
    } else if (isError) {
      return const Text(
        "حدث خطأ ما",
        style: TextStyle(fontSize: 15, color: Colors.red),
      );
    } else if (doctorsProvider.doctors.isEmpty) {
      return const Text(
        "وَإِذَا مَرِضْتُ فَهُوَ يَشْفِيْن",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Colors.cyan,
        ),
      );
    } else {
      return SizedBox(
        height: context.heightR(.45),
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
                top: 5,
              ), // Add desired spacing between cards here
              child: SizedBox(
                width: 150, // Set the desired width
                // Set the desired height
                child: DoctorCard(
                    doctor:
                        doctor), // Replace DoctorCard with your custom widget
              ),
            );
          },
        ),
      );
    }
  }
}
