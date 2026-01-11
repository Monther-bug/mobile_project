import 'package:flutter/material.dart';
import 'package:final_mobile_project/features/problems/data/datasources/solution_remote_data_source.dart';
import 'package:final_mobile_project/features/problems/data/models/solution_model.dart';

class SolutionProvider extends ChangeNotifier {
  final SolutionRemoteDataSource _dataSource = SolutionRemoteDataSource();

  Solution? _currentSolution;
  List<Solution> _submissionHistory = [];
  bool _isSubmitting = false;
  bool _isLoadingHistory = false;
  String? _errorMessage;
  String? _successMessage;

 
  Solution? get currentSolution => _currentSolution;
  List<Solution> get submissionHistory => _submissionHistory;
  bool get isSubmitting => _isSubmitting;
  bool get isLoadingHistory => _isLoadingHistory;
  String? get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;

  Future<void> submitSolution({
    required int problemId,
    required String code,
    int? timeTaken,
  }) async {
    _isSubmitting = true;
    _clearMessages();
    notifyListeners();

    try {
      final request = SubmitSolutionRequest(
        problemId: problemId,
        code: code,
        timeTaken: timeTaken,
      );

      final response = await _dataSource.submitSolution(request);
      _currentSolution = response.solution;
      _successMessage = response.message;

      _submissionHistory.insert(0, response.solution);

      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

 
  Future<void> fetchSubmissionHistory() async {
    _isLoadingHistory = true;
    _clearMessages();
    notifyListeners();

    try {
      _submissionHistory = await _dataSource.getUserHistory();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _isLoadingHistory = false;
      notifyListeners();
    }
  }

  
  Future<bool> updateSolution({
    required int solutionId,
    required String code,
  }) async {
    _isSubmitting = true;
    _clearMessages();
    notifyListeners();

    try {
      final updatedSolution = await _dataSource.updateSolution(
        solutionId,
        code,
      );

      final index = _submissionHistory.indexWhere((s) => s.id == solutionId);
      if (index != -1) {
        _submissionHistory[index] = updatedSolution;
      }

      _currentSolution = updatedSolution;
      _successMessage = 'Solution updated successfully';
      notifyListeners();
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  /// Delete a solution
  Future<bool> deleteSolution(int solutionId) async {
    _clearMessages();
    notifyListeners();

    try {
      await _dataSource.deleteSolution(solutionId);

      // Remove from history
      _submissionHistory.removeWhere((s) => s.id == solutionId);

      if (_currentSolution?.id == solutionId) {
        _currentSolution = null;
      }

      _successMessage = 'Solution deleted successfully';
      notifyListeners();
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    }
  }

  /// Clear current solution
  void clearCurrentSolution() {
    _currentSolution = null;
    _clearMessages();
    notifyListeners();
  }

  /// Clear messages
  void clearMessages() {
    _clearMessages();
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    _successMessage = null;
  }

  void _clearMessages() {
    _errorMessage = null;
    _successMessage = null;
  }
}
