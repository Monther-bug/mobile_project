import 'package:dio/dio.dart';
import 'package:final_mobile_project/core/network/api_client.dart';
import 'package:final_mobile_project/features/problems/data/models/solution_model.dart';

class SolutionRemoteDataSource {
  final Dio _dio = ApiClient().dio;

  /// Submit a solution for a problem
  Future<SolutionResponse> submitSolution(SubmitSolutionRequest request) async {
    try {
      final response = await _dio.post('/solutions', data: request.toJson());

      // Handle response format
      final data = response.data;
      return SolutionResponse.fromJson(data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Get user's submission history
  Future<List<Solution>> getUserHistory() async {
    try {
      final response = await _dio.get('/user/history');

      // Handle response format
      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        return (data['data'] as List)
            .map((json) => Solution.fromJson(json))
            .toList();
      } else if (data is List) {
        return data.map((json) => Solution.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Get solution by ID
  Future<Solution> getSolutionById(int id) async {
    try {
      final response = await _dio.get('/solutions/$id');

      // Handle response format
      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        return Solution.fromJson(Map<String, dynamic>.from(data['data']));
      } else if (data is Map) {
        return Solution.fromJson(Map<String, dynamic>.from(data));
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
