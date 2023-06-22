import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/providers/categories_provider.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    final categories = categoriesProvider.categories;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: FutureBuilder(
        future: categoriesProvider.fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                return ListTile(
                  title: Text(category.id as String),
                );
              },
            );
          }
        },
      ),
    );
  }
}
