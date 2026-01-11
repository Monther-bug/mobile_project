import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../../auth/providers/auth_provider.dart';
import '../../../../core/routes/app_router.dart';

class ProfileController {
  final BuildContext context;

  ProfileController({required this.context});

  ProfileProvider get _profileProvider => context.read<ProfileProvider>();
  AuthProvider get _authProvider => context.read<AuthProvider>();

  void initialize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileProvider.fetchUserStats();
      _profileProvider.fetchUserProfile();
    });
  }

  void navigateToLeaderboard() => context.push(AppRoutes.leaderboard);

  void navigateToHistory() => context.push(AppRoutes.history);

  void navigateToAbout() => context.push(AppRoutes.about);

  Future<bool> showLogoutConfirmation(
    String title,
    String message,
    String cancel,
    String logout,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(logout),
          ),
        ],
      ),
    );
    return confirmed ?? false;
  }

  Future<void> handleLogout(
    String title,
    String message,
    String cancel,
    String logout,
  ) async {
    final confirmed = await showLogoutConfirmation(
      title,
      message,
      cancel,
      logout,
    );
    if (confirmed && context.mounted) {
      await _authProvider.logout();
      if (context.mounted) context.go(AppRoutes.login);
    }
  }

  void showLanguageSheet(Widget sheet) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => sheet,
    );
  }
}
