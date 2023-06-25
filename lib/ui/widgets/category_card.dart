import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:tabibuk/configs/themes/dimensions.dart';
import '../../data/models/category_model.dart';

// TODO : - Make it identical to design.
// TODO : - Make it clickable and when pressed (selected) show a blue glow around it.
// TODO : - Hints : You may need a isSelected state to this widget
// TODO : - Hints : The glow could me be made with the decoration property of the container.
class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(D.sizeSmall),
      child: Column(
        children: [
          Image.network(
            category.image,
            width: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: D.sizeSmall),
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
