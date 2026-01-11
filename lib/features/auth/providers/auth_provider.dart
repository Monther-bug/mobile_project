import 'package:flutter/material.dart';
import 'package:final_mobile_project/core/utils/error_handler.dart';
import 'package:final_mobile_project/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:final_mobile_project/features/auth/data/models/auth_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthProvider extends ChangeNotifier {
  final AuthRemoteDataSource _dataSource = AuthRemoteDataSource();

  bool _isLoading = false;
  String? _errorMessage;
  bool _isAuthenticated = false;
  User? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _isAuthenticated;
  User? get user => _user;

  Future<void> login(String email, String password) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _dataSource.login(
        LoginRequest(email: email, password: password),
      );
      await _saveToken(response.accessToken);

      if (response.user != null) {
        _user = response.user;
        await _saveUser(response.user!);
      } else {
        await _fetchCurrentUser();
      }

      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      _setError(ErrorHandler.getSimpleMessage(e));
    } finally {
      _setLoading(false);
    }
  }

  Future<void> register(String name, String email, String password) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _dataSource.register(
        RegisterRequest(name: name, email: email, password: password),
      );
      await _saveToken(response.accessToken);

      // Fetch user data after registration
      await _fetchCurrentUser();

      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      _setError(ErrorHandler.getSimpleMessage(e));
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _fetchCurrentUser() async {
    try {
      _user = await _dataSource.getCurrentUser();
      await _saveUser(_user!);
      notifyListeners();
    } catch (e) {
      // User fetch failed, but we're still authenticated
      print('Error fetching user: $e');
    }
  }

  Future<void> logout() async {
    _setLoading(true);
    try {
      await _dataSource.logout();
    } catch (e) {
      // Continue with local logout even if API fails
      print('Logout API error: $e');
    } finally {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('access_token');
      await prefs.remove('user_data');
      _isAuthenticated = false;
      _user = null;
      _setLoading(false);
      notifyListeners();
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  Future<void> _saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_data', jsonEncode(user.toJson()));
  }

  Future<User?> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user_data');
    if (userData != null) {
      return User.fromJson(jsonDecode(userData));
    }
    return null;
  }

  // Check if already logged in on startup
  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    if (token != null && token.isNotEmpty) {
      _isAuthenticated = true;
      _user = await _loadUser();

      // Try to refresh user data from API
      try {
        await _fetchCurrentUser();
      } catch (e) {
        // Use cached user data if API fails
        print('Error refreshing user: $e');
      }

      notifyListeners();
    }
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
    notifyListeners();
  }
}
