import 'package:flutter/material.dart';
import 'package:final_mobile_project/features/problems/data/datasources/problem_remote_data_source.dart';
import 'package:final_mobile_project/features/home/data/models/exercise_model.dart';

class ProblemProvider extends ChangeNotifier {
  final ProblemRemoteDataSource _dataSource = ProblemRemoteDataSource();

  Problem? _currentProblem;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isLoadingHint = false;

  // Getters
  Problem? get currentProblem => _currentProblem;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isLoadingHint => _isLoadingHint;

  /// Fetch a problem by ID
  Future<void> fetchProblemById(int id) async {
    _setLoading(true);
    _clearError();

    try {
      _currentProblem = await _dataSource.getProblemById(id);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  /// Fetch hint for current problem
  Future<void> fetchHint(int problemId) async {
    if (_currentProblem == null) return;

    _isLoadingHint = true;
    notifyListeners();

    try {
      final hint = await _dataSource.getProblemHint(problemId);

      // Update current problem with hint
      _currentProblem = Problem(
        id: _currentProblem!.id,
        exerciseId: _currentProblem!.exerciseId,
        title: _currentProblem!.title,
        content: _currentProblem!.content,
        difficulty: _currentProblem!.difficulty,
        hint: hint,
        category: _currentProblem!.category,
        testCases: _currentProblem!.testCases,
        createdAt: _currentProblem!.createdAt,
        updatedAt: _currentProblem!.updatedAt,
      );

      _clearError();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _isLoadingHint = false;
      notifyListeners();
    }
  }

  /// Set a problem directly (when navigating from exercise list)
  void setProblem(Problem problem) {
    _currentProblem = problem;
    _clearError();
    notifyListeners();
  }

  /// Clear current problem
  void clearProblem() {
    _currentProblem = null;
    _clearError();
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
