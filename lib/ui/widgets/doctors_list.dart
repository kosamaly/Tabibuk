import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:tabibuk/logic/providers/doctors_provider.dart';

import 'doctors_card.dart';

class DoctorsList extends StatefulWidget {
  final String categoryId;
  DoctorsList({required this.categoryId});

  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  List<dynamic> doctors = [];

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  void fetchDoctors() async {
    try {
      final response = await Dio().get(
        'https://example.com/doctors',
        queryParameters: {'category_id': widget.categoryId},
      );
      setState(() {
        doctors = response.data;
      });
    } catch (e) {
      print(e);
    }
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
          height: 133,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
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
