import 'package:flutter/material.dart';

class SelectedCategoryProvider extends ChangeNotifier {
  int _selectedCategoryId = 0;

  int get selectedCategoryId => _selectedCategoryId;

  set selectedCategoryId(int value) {
    _selectedCategoryId = value;
    notifyListeners();
  }
}
