import 'package:dio/dio.dart';
import 'package:final_mobile_project/core/network/api_client.dart';
import 'package:final_mobile_project/features/home/data/models/exercise_model.dart';

class ProblemRemoteDataSource {
  final Dio _dio = ApiClient().dio;

  Future<Problem> getProblemById(int id) async {
    try {
      final response = await _dio.get('/problems/$id');

   
      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        return Problem.fromJson(Map<String, dynamic>.from(data['data']));
      } else if (data is Map) {
        return Problem.fromJson(Map<String, dynamic>.from(data));
      } else {
        throw Exception('Unexpected response format');
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  
  Future<String> getProblemHint(int id) async {
    try {
      final response = await _dio.get('/problems/$id/hint');

      
      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        final hintData = data['data'];
        return hintData['hint'] ?? '';
      } else if (data is Map && data.containsKey('hint')) {
        return data['hint'] ?? '';
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
