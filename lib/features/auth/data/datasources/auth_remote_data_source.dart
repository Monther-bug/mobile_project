import 'package:dio/dio.dart';
import 'package:final_mobile_project/core/network/api_client.dart';
import 'package:final_mobile_project/features/auth/data/models/auth_models.dart';

class AuthRemoteDataSource {
  final Dio _dio = ApiClient().dio;

  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post('/login', data: request.toJson());
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _dio.post('/register', data: request.toJson());
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException error) {
    if (error.response != null) {
      if (error.response?.data is Map &&
          error.response?.data['message'] != null) {
        return error
            .response
            ?.data['message']; // Standard Laravel error structure
      }
      // Check for validation errors which might come as a map of arrays
      if (error.response?.data['errors'] != null) {
        final errors = error.response?.data['errors'] as Map<String, dynamic>;
        final firstError = errors.values.first;
        if (firstError is List && firstError.isNotEmpty) {
          return firstError.first.toString();
        }
      }
      return error.response?.statusMessage ?? 'Server Error';
    }
    return error.message ?? 'Unknown Error';
  }
}
