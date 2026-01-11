import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../auth/providers/auth_provider.dart';
import 'logout_dialog.dart';
import 'language_sheet.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, l10n.activity),
        SizedBox(height: 16.h),
        _buildMenuItem(context, Iconsax.cup, l10n.leaderboard, () => context.push(AppRoutes.leaderboard)),
        _buildMenuItem(context, Iconsax.document_text, l10n.submissionHistory, () => context.push(AppRoutes.history)),
        SizedBox(height: 16.h),
        _buildSectionTitle(context, l10n.settings),
        SizedBox(height: 16.h),
        _buildMenuItem(context, Iconsax.notification, l10n.notifications, null),
        _buildMenuItem(context, Iconsax.global, l10n.language, () => _showLanguageSheet(context, l10n)),
        _buildDarkModeToggle(context, l10n.darkMode),
        _buildMenuItem(context, Iconsax.security_safe, l10n.privacySecurity, null),
        _buildMenuItem(context, Iconsax.info_circle, l10n.aboutApp, () => context.push(AppRoutes.about)),
        SizedBox(height: 24.h),
        _buildMenuItem(context, Iconsax.logout, l10n.logout, () => _handleLogout(context, l10n), isDestructive: true),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.getPrimaryBlack(context))),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, VoidCallback? onTap, {bool isDestructive = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(color: AppColors.getInputFill(context), borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          children: [
            Icon(icon, color: isDestructive ? Colors.red : AppColors.getPrimaryBlack(context), size: 24.sp),
            SizedBox(width: 16.w),
            Expanded(child: Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: isDestructive ? Colors.red : AppColors.getPrimaryBlack(context)))),
            Icon(Iconsax.arrow_right_3, size: 20.sp, color: AppColors.getTextGrey(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildDarkModeToggle(BuildContext context, String title) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(color: AppColors.getInputFill(context), borderRadius: BorderRadius.circular(12.r)),
          child: Row(
            children: [
              Icon(Iconsax.moon, color: AppColors.getPrimaryBlack(context), size: 24.sp),
              SizedBox(width: 16.w),
              Expanded(child: Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.getPrimaryBlack(context)))),
              Switch(
                value: themeProvider.isDarkMode,
                onChanged: (val) => themeProvider.toggleTheme(),
                activeColor: AppColors.getPrimaryBlack(context),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _handleLogout(BuildContext context, AppLocalizations l10n) async {
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (_) => LogoutDialog(l10n: l10n),
    );
    if (confirmed == true && context.mounted) {
      await context.read<AuthProvider>().logout();
      if (context.mounted) context.go(AppRoutes.login);
    }
  }

  void _showLanguageSheet(BuildContext context, AppLocalizations l10n) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      builder: (_) => LanguageSheet(l10n: l10n),
    );
  }
}
