import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late final Dio dio;

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.14.111.39:8000/api',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add authentication interceptor
    dio.interceptors.add(AuthInterceptor());

    // Add logging interceptor for debugging
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}

/// Interceptor to automatically attach Bearer token to requests
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('access_token');

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      // If there's an error reading the token, continue without it
      print('Error reading token: $e');
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthorized - token expired or invalid
    if (err.response?.statusCode == 401) {
      // Clear the invalid token
      _clearToken();

      // You can add navigation to login page here if needed
      // For now, just pass the error along
    }

    handler.next(err);
  }

  Future<void> _clearToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('access_token');
    } catch (e) {
      print('Error clearing token: $e');
    }
  }
}
