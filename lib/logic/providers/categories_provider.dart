import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'category_model.dart';

class CategoriesProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  Future<void> fetchCategories() async {
    try {
      final response =
          await Dio().get('https://72lg3.wiremockapi.cloud/categories');
      final data = response.data['categories'];

      _categories = List<CategoryModel>.from(
        data.map((categoryData) => CategoryModel(
              id: categoryData['id'],
              name: categoryData['name'],
              image: categoryData['image'],
            )),
      );

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch or parse categories: $e');
      }
    }
  }
}
