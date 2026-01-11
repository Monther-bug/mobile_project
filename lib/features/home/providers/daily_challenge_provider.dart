import 'package:flutter/material.dart';
import 'package:final_mobile_project/features/home/data/datasources/daily_challenge_remote_data_source.dart';
import 'package:final_mobile_project/features/home/data/models/daily_challenge_model.dart';

class DailyChallengeProvider extends ChangeNotifier {
  final DailyChallengeRemoteDataSource _dataSource =
      DailyChallengeRemoteDataSource();

  DailyChallenge? _dailyChallenge;
  bool _isLoading = false;
  String? _errorMessage;

  DailyChallenge? get dailyChallenge => _dailyChallenge;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasChallenge => _dailyChallenge != null;

  
  Future<void> fetchDailyChallenge() async {
    if (_isLoading) return;

    _isLoading = true;
    _clearError();
    notifyListeners();

    try {
      _dailyChallenge = await _dataSource.getDailyChallenge();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await fetchDailyChallenge();
  }

  void markAsCompleted() {
    if (_dailyChallenge != null) {
      _dailyChallenge = DailyChallenge(
        id: _dailyChallenge!.id,
        title: _dailyChallenge!.title,
        difficulty: _dailyChallenge!.difficulty,
        category: _dailyChallenge!.category,
        exerciseTitle: _dailyChallenge!.exerciseTitle,
        exerciseId: _dailyChallenge!.exerciseId,
        isCompleted: true,
        points: _dailyChallenge!.points,
        date: _dailyChallenge!.date,
      );
      notifyListeners();
    }
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
  }
}
