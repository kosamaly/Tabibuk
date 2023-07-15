import 'package:flutter/material.dart';
import '../../data/models/category_model.dart';

/// TODO Use Selected Category Provider
class CategoryCard extends StatefulWidget {
  final CategoryModel category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  CategoryCardState createState() => CategoryCardState();
}

class CategoryCardState extends State<CategoryCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = true;
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
              widget.category.image,
              height: 55,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Text(
                widget.category.name,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
