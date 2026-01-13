import 'package:flutter/material.dart';
import 'package:final_mobile_project/core/utils/error_handler.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/notifications_remote_datasource.dart';
import '../../data/repositories/notifications_repository_impl.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/usecases/get_notifications_usecase.dart';

class NotificationProvider extends ChangeNotifier {
  late final GetNotificationsUseCase _getNotificationsUseCase;

  List<NotificationEntity> _notifications = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<NotificationEntity> get notifications => _notifications;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  NotificationProvider() {
    final apiClient = ApiClient();
    final remoteDataSource = NotificationsRemoteDataSourceImpl(
      apiClient: apiClient,
    );
    final repository = NotificationsRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );
    _getNotificationsUseCase = GetNotificationsUseCase(repository);
  }

  Future<void> loadNotifications() async {
    _setLoading(true);
    _clearError();

    try {
      _notifications = await _getNotificationsUseCase.call();
      notifyListeners();
    } catch (e) {
      _setError(ErrorHandler.getSimpleMessage(e));
    } finally {
      _setLoading(false);
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
