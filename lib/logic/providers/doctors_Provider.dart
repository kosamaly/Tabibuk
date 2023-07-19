import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/doctors_model.dart';
import '../../data/remote/endpoints.dart';

class DoctorsProvider extends ChangeNotifier {
  // Dio instance for making HTTP requests
  Dio dio = Dio();

  List<DoctorsModel> _doctors = [];
  bool isLoading = false;
  bool isEmpty = false;

  // State error
  bool isError = false;

  List<DoctorsModel> get doctors => _doctors;

  Future<void> fetchDoctors() async {
    try {
      isEmpty = true;
      notifyListeners();
      isLoading = true;
      notifyListeners();
      final response = await Dio().get(Endpoints.doctors);
      final rawCategoriesData = response.data;
      debugPrint(rawCategoriesData.toString());
      _doctors = (rawCategoriesData as List)
          .map((data) => DoctorsModel.fromJson(data))
          .toList();
      // closing the loading
      isLoading = false;
      notifyListeners();
    } catch (e, stacktrace) {
      debugPrint('Failed to fetch or parse doctors: $e');
      debugPrint(stacktrace.toString());
      isEmpty = false;
      isLoading = false;
      isError = true;
      notifyListeners();
    }
  }
}
