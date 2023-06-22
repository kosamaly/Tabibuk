import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../data/models/category_model.dart';

class CategoriesProvider with ChangeNotifier {
  // State categories (success)
  List<CategoryModel> _categories = [];

  // State loading
  bool _isLoading = false;
  // State error
  bool _isError = false;

  // State getters for UI usage
  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;
  bool get isError => _isError;

  Future<void> fetchCategories() async {
    log("Fetch categories");

    try {
      _isLoading = true;
      notifyListeners();

      final response =
          await Dio().get('https://72lg3.wiremockapi.cloud/categories');
      final rawCategoriesData = response.data['data']['categories'];
      debugPrint(rawCategoriesData.toString());

      _categories = (rawCategoriesData as List)
          .map(
            (e) => CategoryModel.fromJson(e),
          )
          .toList();
      _isLoading = false;
      notifyListeners();
    } catch (e, stacktrace) {
      debugPrint('Failed to fetch or parse categories: $e');
      debugPrint(stacktrace.toString());
      _isLoading = false;
      _isError = true;
      notifyListeners();
    }
  }
}
