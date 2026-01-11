import 'package:flutter/material.dart';
import 'package:final_mobile_project/features/home/data/datasources/category_remote_data_source.dart';
import 'package:final_mobile_project/features/home/data/models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRemoteDataSource _dataSource = CategoryRemoteDataSource();

  List<Category> _categories = [];
  String _selectedCategory = 'All';
  bool _isLoading = false;
  String? _errorMessage;

  List<Category> get categories => _categories;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  List<String> get categoryNames {
    return ['All', ..._categories.map((c) => c.name)];
  }

  Future<void> fetchCategories() async {
    if (_isLoading) return;

    _isLoading = true;
    _clearError();
    notifyListeners();

    try {
      _categories = await _dataSource.getCategories();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }


  Category? getCategoryByName(String name) {
    try {
      return _categories.firstWhere(
        (c) => c.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  
  int get totalExerciseCount {
    return _categories.fold(0, (sum, category) => sum + category.exerciseCount);
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
  }
}
