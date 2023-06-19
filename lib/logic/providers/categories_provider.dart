import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'cat.dart';

class CategoriesProvider with ChangeNotifier {
  List<Cat> _categories = [];

  List<Cat> get categories => _categories;

  Future<void> fetchCategories() async {
    try {
      final response =
          await Dio().get('https://72lg3.wiremockapi.cloud/categories');
      final data = response.data['categories'];

      _categories = List<Cat>.from(
        data.map((categoryData) => Cat(
              id: categoryData['id'],
              name: categoryData['name'],
              image: categoryData['image'],
            )),
      );

      notifyListeners();
    } catch (e) {
      // Handle network failures or parsing issues here.
      if (kDebugMode) {
        print('Failed to fetch or parse categories: $e');
      }
    }
  }
}
