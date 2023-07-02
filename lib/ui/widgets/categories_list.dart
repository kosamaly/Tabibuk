import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabibuk/helpers/context_extensions.dart';
import 'package:tabibuk/helpers/ui_helpers.dart';
import 'package:tabibuk/logic/providers/categories_provider.dart';
import 'package:tabibuk/ui/widgets/category_card.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  void initState() {
    super.initState();
    UiHelper.postBuild((_) {
      context.read<CategoriesProvider>().fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = context.watch<CategoriesProvider>();
    final categories = categoriesProvider.categories;
    final isLoading = categoriesProvider.isLoading;
    final isError = categoriesProvider.isError;

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
          height: 144,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: const EdgeInsets.only(
                    right: 8,
                    left: 8,
                    bottom: 8,
                    top: 8), // Add desired spacing between cards here
                child: SizedBox(
                  width: 200, // Set the desired width
                  // Set the desired height
                  child: CategoryCard(
                      category:
                          category), // Replace CategoryCard with your custom widget
                ),
              );
            },
          ));
    }
  }
}
