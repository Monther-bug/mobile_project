import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';

enum SplashNavigationDestination { unknown, home, login, onboarding }

class SplashProvider extends ChangeNotifier {
  final AuthProvider _authProvider;
  SplashNavigationDestination _destination = SplashNavigationDestination.unknown;

  SplashProvider(this._authProvider);

  SplashNavigationDestination get destination => _destination;

  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Future<void> initSplash() async {
    final minDelayFuture = Future.delayed(const Duration(seconds: 2));
    final authCheckFuture = _authProvider.checkAuthStatus();
    final onboardingCheckFuture = _checkOnboardingStatus();

    await Future.wait([minDelayFuture, authCheckFuture, onboardingCheckFuture]);

    if (_isDisposed) return;

    final hasSeenOnboarding = await onboardingCheckFuture;

    if (_authProvider.isAuthenticated) {
      _destination = SplashNavigationDestination.home;
    } else if (!hasSeenOnboarding) {
      _destination = SplashNavigationDestination.onboarding;
    } else {
      _destination = SplashNavigationDestination.login;
    }

    if (!_isDisposed) {
      notifyListeners();
    }
  }

  Future<bool> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasSeenOnboarding') ?? false;
  }
}
