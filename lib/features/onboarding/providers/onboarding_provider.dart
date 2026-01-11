import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentPage = 0;
  bool _isCompleting = false;

  int get currentPage => _currentPage;
  bool get isCompleting => _isCompleting;

  
  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }


  void nextPage(PageController pageController, int totalPages) {
    if (isLastPage(totalPages)) {
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  bool isLastPage(int totalPages) {
    return _currentPage == totalPages - 1;
  }

  
  String getButtonText(int totalPages, String nextText, String getStartedText) {
    return isLastPage(totalPages) ? getStartedText : nextText;
  }

  
  Future<void> completeOnboarding() async {
    if (_isCompleting) return;

    _isCompleting = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('hasSeenOnboarding', true);
    } finally {
      _isCompleting = false;
      notifyListeners();
    }
  }

  /// Reset state
  void reset() {
    _currentPage = 0;
    _isCompleting = false;
    notifyListeners();
  }
}
