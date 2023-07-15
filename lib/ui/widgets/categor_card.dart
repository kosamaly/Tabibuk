import 'package:flutter/material.dart';
import '../../data/models/category_model.dart';
import 'doctors_list.dart';

class CategoryCard extends StatefulWidget {
  final CategoryModel category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  final ValueNotifier<bool> isSelected = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DoctorsList(categoryId: widget.category.categoryId.toString()),
          ),
        );
        isSelected.value = true;
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isSelected.value
                  ? Colors.blue.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: isSelected.value ? 15 : 15,
              spreadRadius: isSelected.value ? 1 : 1,
              offset: isSelected.value ? Offset(2, 2) : Offset(2, 2),
            ),
            BoxShadow(
              color: isSelected.value
                  ? Colors.blue.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.4),
              blurRadius: isSelected.value ? 6 : 6,
              spreadRadius: isSelected.value ? 3 : 3,
              offset: isSelected.value ? Offset(1, 1) : Offset(1, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(9),
        child: Column(
          children: [
            Image.network(
              widget.category.image,
              height: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              widget.category.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
