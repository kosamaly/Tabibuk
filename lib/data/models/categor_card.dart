import 'package:flutter/material.dart';
import 'category_model.dart';

import 'package:provider/provider.dart';

class CategoryCard extends StatefulWidget {
  final CategoryModel categories;

  const CategoryCard({Key? key, required this.categories}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.network(
                widget.categories.image,
                width: 19,
                height: 60,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8),
              Text(
                widget.categories.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
