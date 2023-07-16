import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/category_model.dart';
import '../../logic/providers/selected_category_provider.dart';
import '../../logic/providers/selected_categoy_provider.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedCategoryProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            provider.selectedCategoryId = category.categoryId;
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: provider.selectedCategoryId == category.categoryId
                      ? Colors.blue.withOpacity(0.5)
                      : Colors.grey.withOpacity(0.1),
                  blurRadius: provider.selectedCategoryId == category.categoryId
                      ? 15
                      : 15,
                  spreadRadius:
                      provider.selectedCategoryId == category.categoryId
                          ? 1
                          : 1,
                  offset: provider.selectedCategoryId == category.categoryId
                      ? const Offset(2, 2)
                      : const Offset(2, 2),
                ),
                BoxShadow(
                  color: provider.selectedCategoryId == category.categoryId
                      ? Colors.blue.withOpacity(0.5)
                      : Colors.grey.withOpacity(0.4),
                  blurRadius: provider.selectedCategoryId == category.categoryId
                      ? 6
                      : 6,
                  spreadRadius:
                      provider.selectedCategoryId == category.categoryId
                          ? 3
                          : 3,
                  offset: provider.selectedCategoryId == category.categoryId
                      ? const Offset(1, 1)
                      : const Offset(1, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.network(
                    category.image,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      category.name,
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
          ),
        );
      },
    );
  }
}
