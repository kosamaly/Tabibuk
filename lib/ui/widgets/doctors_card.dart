import 'package:flutter/material.dart';
import 'package:tabibuk/data/models/doctors_model.dart';

class DoctorCard extends StatefulWidget {
  final DoctorsModel doctor;

  const DoctorCard({Key? key, required this.doctor}) : super(key: key);

  @override
  DoctorCardState createState() => DoctorCardState();
}

class DoctorCardState extends State<DoctorCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.doctor.name);
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? Colors.blue.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: isSelected ? 15 : 15,
              spreadRadius: isSelected ? 1 : 1,
              offset: isSelected ? const Offset(2, 2) : const Offset(2, 2),
            ),
            BoxShadow(
              color: isSelected
                  ? Colors.blue.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.4),
              blurRadius: isSelected ? 6 : 6,
              spreadRadius: isSelected ? 3 : 3,
              offset: isSelected ? const Offset(1, 1) : const Offset(1, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(9),
        child: Column(
          children: [
            Image.network(
              widget.doctor.image,
              width: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              widget.doctor.name,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
