import 'package:flutter/material.dart';
import 'package:final_mobile_project/features/home/data/models/exercise_model.dart';

class DiscoverProvider extends ChangeNotifier {
  String _searchQuery = '';
  String _selectedDifficulty = 'All';
  String _selectedCategory = 'All';

  String get searchQuery => _searchQuery;
  String get selectedDifficulty => _selectedDifficulty;
  String get selectedCategory => _selectedCategory;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setDifficulty(String difficulty) {
    _selectedDifficulty = difficulty;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void resetFilters() {
    _searchQuery = '';
    _selectedDifficulty = 'All';
    _selectedCategory = 'All';
    notifyListeners();
  }

  List<Problem> getAllProblems(List<Exercise> exercises) {
    List<Problem> allProblems = [];
    for (var exercise in exercises) {
      if (exercise.problems != null) {
        for (var problem in exercise.problems!) {
          allProblems.add(
            Problem(
              id: problem.id,
              exerciseId: problem.exerciseId,
              title: problem.title,
              content: problem.content,
              difficulty: problem.difficulty,
              hint: problem.hint,
              category: exercise.category,
              testCases: problem.testCases,
              createdAt: problem.createdAt,
              updatedAt: problem.updatedAt,
            ),
          );
        }
      }
    }
    return allProblems;
  }

  List<Problem> getFilteredProblems(List<Exercise> exercises) {
    final allProblems = getAllProblems(exercises);

    return allProblems.where((problem) {
      final matchesSearch = _searchQuery.isEmpty ||
          problem.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (problem.category?.toLowerCase() ?? '')
              .contains(_searchQuery.toLowerCase());

      final matchesDifficulty = _selectedDifficulty == 'All' ||
          problem.difficulty.toLowerCase() == _selectedDifficulty.toLowerCase();

      
      final matchesCategory =
          _selectedCategory == 'All' || problem.category == _selectedCategory;

      return matchesSearch && matchesDifficulty && matchesCategory;
    }).toList();
  }

  
  List<String> getCategories(List<Exercise> exercises) {
    final categories = <String>{'All'};
    for (var exercise in exercises) {
      categories.add(exercise.category);
    }
    return categories.toList();
  }
}
