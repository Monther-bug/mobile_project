import 'package:dio/dio.dart';
import 'package:final_mobile_project/core/network/api_client.dart';
import 'package:final_mobile_project/features/profile/data/models/profile_models.dart';

class ProfileRemoteDataSource {
  final Dio _dio = ApiClient().dio;

  
  Future<UserStats> getUserStats() async {
    try {
      final response = await _dio.get('/user/stats');
      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        return UserStats.fromJson(Map<String, dynamic>.from(data['data']));
      } else if (data is Map) {
        return UserStats.fromJson(Map<String, dynamic>.from(data));
      } else {
        throw Exception('Unexpected response format');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }


  Future<UserProfile> getUserProfile() async {
    try {
      final response = await _dio.get('/user/profile');

      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        return UserProfile.fromJson(Map<String, dynamic>.from(data['data']));
      } else if (data is Map) {
        return UserProfile.fromJson(Map<String, dynamic>.from(data));
      } else {
        throw Exception('Unexpected response format');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<LeaderboardEntry>> getLeaderboard() async {
    try {
      final response = await _dio.get('/leaderboard');

      
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


  Future<List<UserProgress>> getUserProgress() async {
    try {
      final response = await _dio.get('/user/progress');


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
