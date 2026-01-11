import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left, color: AppColors.primaryBlack),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.aboutApp,
          style: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            _buildLogo(),
            SizedBox(height: 24.h),
            _buildAppInfo(l10n),
            SizedBox(height: 32.h),
            _buildInfoSection(l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.primaryBlack,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Icon(Iconsax.code, size: 50.sp, color: Colors.white),
    );
  }

  Widget _buildAppInfo(AppLocalizations l10n) {
    return Column(
      children: [
        Text(
          'CodeMaster',
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlack,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Version 1.0.0',
          style: TextStyle(fontSize: 14.sp, color: AppColors.textGrey),
        ),
        SizedBox(height: 16.h),
        Text(
          l10n.appDescription,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.textBlack,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoItem(Iconsax.code_1, l10n.features, l10n.featuresDescription),
        SizedBox(height: 16.h),
        _buildInfoItem(
          Iconsax.teacher,
          l10n.learning,
          l10n.learningDescription,
        ),
        SizedBox(height: 16.h),
        _buildInfoItem(
          Iconsax.cup,
          l10n.challenges,
          l10n.challengesDescription,
        ),
        SizedBox(height: 32.h),
        Center(
          child: Text(
            '© 2026 CodeMaster',
            style: TextStyle(fontSize: 12.sp, color: AppColors.textGrey),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String description) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24.sp, color: AppColors.primaryBlack),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlack,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textGrey,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
