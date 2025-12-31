import 'package:dio/dio.dart';
import 'package:final_mobile_project/core/network/api_client.dart';
import 'package:final_mobile_project/features/profile/data/models/profile_models.dart';

class ProfileRemoteDataSource {
  final Dio _dio = ApiClient().dio;

  /// Fetch leaderboard
  Future<List<LeaderboardEntry>> getLeaderboard() async {
    try {
      final response = await _dio.get('/leaderboard');

      // Handle response format
      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        return (data['data'] as List)
            .map((json) => LeaderboardEntry.fromJson(json))
            .toList();
      } else if (data is List) {
        return data.map((json) => LeaderboardEntry.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Update user progress for an exercise
  Future<void> updateProgress(int exerciseId, bool isCompleted) async {
    try {
      await _dio.post(
        '/progress',
        data: {'exercise_id': exerciseId, 'is_completed': isCompleted},
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Get user's progress
  Future<List<UserProgress>> getUserProgress() async {
    try {
      final response = await _dio.get('/user/progress');

      // Handle response format
      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        return (data['data'] as List)
            .map((json) => UserProgress.fromJson(json))
            .toList();
      } else if (data is List) {
        return data.map((json) => UserProgress.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException error) {
    if (error.response != null) {
      if (error.response?.data is Map &&
          error.response?.data['message'] != null) {
        return error.response?.data['message'];
      }
      return error.response?.statusMessage ?? 'Server Error';
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return 'Connection timeout. Please check your internet connection.';
    } else if (error.type == DioExceptionType.connectionError) {
      return 'No internet connection. Please check your network.';
    }
    return error.message ?? 'Unknown error occurred';
  }
}
