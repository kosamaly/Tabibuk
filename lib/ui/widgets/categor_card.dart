import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tabibuk/configs/themes/dimensions.dart';
import '../../data/models/category_model.dart';
import '../screens/doctors_screen.dart';
import 'doctors_list.dart';

class CategoryCard extends StatefulWidget {
  final CategoryModel category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DoctorsScreen()),
        );
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
              offset: isSelected ? Offset(2, 2) : Offset(2, 2),
            ),
            BoxShadow(
              color: isSelected
                  ? Colors.blue.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.4),
              blurRadius: isSelected ? 6 : 6,
              spreadRadius: isSelected ? 3 : 3,
              offset: isSelected ? Offset(1, 1) : Offset(1, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(9),
        child: Column(
          children: [
            Image.network(
              widget.category.image,
              width: 60,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              widget.category.name,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
