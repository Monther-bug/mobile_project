import 'package:dio/dio.dart';
import 'package:final_mobile_project/core/network/api_client.dart';
import 'package:final_mobile_project/features/home/data/models/exercise_model.dart';

class ExerciseRemoteDataSource {
  final Dio _dio = ApiClient().dio;

  /// Fetch paginated list of exercises
  /// Returns exercises from the backend API
  Future<List<Exercise>> getExercises({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/exercises',
        queryParameters: {'page': page},
      );

      // Handle Laravel pagination response
      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        // Paginated response
        return (data['data'] as List)
            .map((json) => Exercise.fromJson(json))
            .toList();
      } else if (data is List) {
        // Direct array response
        return data.map((json) => Exercise.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Fetch a single exercise by ID with its problems
  Future<Exercise> getExerciseById(int id) async {
    try {
      final response = await _dio.get('/exercises/$id');

      // Handle response format
      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        return Exercise.fromJson(Map<String, dynamic>.from(data['data']));
      } else if (data is Map) {
        return Exercise.fromJson(Map<String, dynamic>.from(data));
      } else {
        throw Exception('Unexpected response format');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException error) {
    if (error.response != null) {
      // Server responded with error
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
