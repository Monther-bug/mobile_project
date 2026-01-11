import 'package:flutter/material.dart';
import 'package:final_mobile_project/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:final_mobile_project/features/profile/data/models/profile_models.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRemoteDataSource _dataSource = ProfileRemoteDataSource();

  List<LeaderboardEntry> _leaderboard = [];
  List<UserProgress> _userProgress = [];
  UserStats? _userStats;
  UserProfile? _userProfile;
  bool _isLoadingLeaderboard = false;
  bool _isLoadingProgress = false;
  bool _isLoadingStats = false;
  bool _isLoadingProfile = false;
  String? _errorMessage;

  List<LeaderboardEntry> get leaderboard => _leaderboard;
  List<UserProgress> get userProgress => _userProgress;
  UserStats? get userStats => _userStats;
  UserProfile? get userProfile => _userProfile;
  bool get isLoadingLeaderboard => _isLoadingLeaderboard;
  bool get isLoadingProgress => _isLoadingProgress;
  bool get isLoadingStats => _isLoadingStats;
  bool get isLoadingProfile => _isLoadingProfile;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUserStats() async {
    _isLoadingStats = true;
    _clearError();
    notifyListeners();

    try {
      _userStats = await _dataSource.getUserStats();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _isLoadingStats = false;
      notifyListeners();
    }
  }

  Future<void> fetchUserProfile() async {
    _isLoadingProfile = true;
    _clearError();
    notifyListeners();

    try {
      _userProfile = await _dataSource.getUserProfile();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _isLoadingProfile = false;
      notifyListeners();
    }
  }

  
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

  Future<void> updateProgress(int exerciseId, bool isCompleted) async {
    try {
      await _dataSource.updateProgress(exerciseId, isCompleted);

      await fetchUserProgress();
    } catch (e) {
      _setError(e.toString());
    }
  }

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
