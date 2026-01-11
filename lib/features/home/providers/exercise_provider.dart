import 'package:flutter/material.dart';
import 'package:final_mobile_project/features/home/data/datasources/exercise_remote_data_source.dart';
import 'package:final_mobile_project/features/home/data/models/exercise_model.dart';

class ExerciseProvider extends ChangeNotifier {
  final ExerciseRemoteDataSource _dataSource = ExerciseRemoteDataSource();

  List<Exercise> _exercises = [];
  Exercise? _selectedExercise;
  bool _isLoading = false;
  String? _errorMessage;
  int _currentPage = 1;
  bool _hasMore = true;

  
  List<Exercise> get exercises => _exercises;
  Exercise? get selectedExercise => _selectedExercise;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasMore => _hasMore;

  
  Future<void> fetchExercises({bool refresh = false}) async {
    if (_isLoading) return;

    if (refresh) {
      _currentPage = 1;
      _exercises = [];
      _hasMore = true;
    }

    _setLoading(true);
    _clearError();

    try {
      final newExercises = await _dataSource.getExercises(page: _currentPage);

      if (refresh) {
        _exercises = newExercises;
      } else {
        _exercises.addAll(newExercises);
      }

      
      if (newExercises.isEmpty || newExercises.length < 10) {
        _hasMore = false;
      } else {
        _currentPage++;
      }

      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  
  Future<void> fetchExerciseById(int id) async {
    _setLoading(true);
    _clearError();

    try {
      _selectedExercise = await _dataSource.getExerciseById(id);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  
  List<Exercise> getExercisesByCategory(String category) {
    if (category == 'All') {
      return _exercises;
    }
    return _exercises.where((e) => e.category == category).toList();
  }

  
  void clearSelectedExercise() {
    _selectedExercise = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
  }
}
