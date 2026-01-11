import 'package:dio/dio.dart';
import 'package:final_mobile_project/core/network/api_client.dart';
import 'package:final_mobile_project/features/home/data/models/category_model.dart';

class CategoryRemoteDataSource {
  final Dio _dio = ApiClient().dio;

  Future<List<Category>> getCategories() async {
    try {
      final response = await _dio.get('/categories');

      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        return (data['data'] as List)
            .map((json) => Category.fromJson(json))
            .toList();
      } else if (data is List) {
        return data.map((json) => Category.fromJson(json)).toList();
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
