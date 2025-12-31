import 'package:flutter/material.dart';
import 'package:final_mobile_project/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:final_mobile_project/features/profile/data/models/profile_models.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRemoteDataSource _dataSource = ProfileRemoteDataSource();

  List<LeaderboardEntry> _leaderboard = [];
  List<UserProgress> _userProgress = [];
  bool _isLoadingLeaderboard = false;
  bool _isLoadingProgress = false;
  String? _errorMessage;

  // Getters
  List<LeaderboardEntry> get leaderboard => _leaderboard;
  List<UserProgress> get userProgress => _userProgress;
  bool get isLoadingLeaderboard => _isLoadingLeaderboard;
  bool get isLoadingProgress => _isLoadingProgress;
  String? get errorMessage => _errorMessage;

  /// Fetch leaderboard
  Future<void> fetchLeaderboard() async {
    _isLoadingLeaderboard = true;
    _clearError();
    notifyListeners();

    try {
      _leaderboard = await _dataSource.getLeaderboard();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _isLoadingLeaderboard = false;
      notifyListeners();
    }
  }

  /// Fetch user progress
  Future<void> fetchUserProgress() async {
    _isLoadingProgress = true;
    _clearError();
    notifyListeners();

    try {
      _userProgress = await _dataSource.getUserProgress();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _isLoadingProgress = false;
      notifyListeners();
    }
  }

  /// Update progress for an exercise
  Future<void> updateProgress(int exerciseId, bool isCompleted) async {
    try {
      await _dataSource.updateProgress(exerciseId, isCompleted);

      // Refresh progress after update
      await fetchUserProgress();
    } catch (e) {
      _setError(e.toString());
    }
  }

  /// Check if exercise is completed
  bool isExerciseCompleted(int exerciseId) {
    return _userProgress.any(
      (progress) => progress.exerciseId == exerciseId && progress.isCompleted,
    );
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
  }
}
