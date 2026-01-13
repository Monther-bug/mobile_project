import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../models/notification_model.dart';

abstract class NotificationsRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
}

class NotificationsRemoteDataSourceImpl
    implements NotificationsRemoteDataSource {
  final ApiClient apiClient;

  NotificationsRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      final response = await apiClient.dio.get('/notifications');

      if (response.statusCode == 200) {
        // Handle pagination structure: { "success": true, "data": { "data": [...] } }
        final dataObj = response.data['data'];
        List<dynamic> list = [];

        if (dataObj is Map &&
            dataObj.containsKey('data') &&
            dataObj['data'] is List) {
          list = dataObj['data'];
        } else if (dataObj is List) {
          // Fallback if structure is different
          list = dataObj;
        }

        return list.map((json) => NotificationModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load notifications');
      }
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to load notifications');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
