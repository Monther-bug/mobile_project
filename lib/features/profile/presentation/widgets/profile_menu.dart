import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Settings',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlack,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        _buildSettingItem(Iconsax.edit, 'Edit Profile'),
        _buildSettingItem(Iconsax.notification, 'Notifications'),
        _buildSettingItem(
          Iconsax.global,
          'Language',
          onTap: () => _showLanguageBottomSheet(context),
        ),
        _buildSettingItem(Iconsax.moon, 'Dark Mode', isToggle: true),
        _buildSettingItem(Iconsax.security_safe, 'Privacy & Security'),
        SizedBox(height: 24.h),
        _buildSettingItem(Iconsax.logout, 'Log Out', isDestructive: true),
      ],
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Language',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBlack,
              ),
            ),
            SizedBox(height: 24.h),
            _buildLanguageItem(context, 'English', true),
            _buildLanguageItem(context, 'Spanish', false),
            _buildLanguageItem(context, 'French', false),
            _buildLanguageItem(context, 'German', false),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageItem(
      BuildContext context, String language, bool isSelected) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: AppColors.primaryBlack,
              ),
            ),
            if (isSelected)
              Icon(Iconsax.tick_circle,
                  color: AppColors.primaryBlack, size: 24.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    IconData icon,
    String title, {
    bool isToggle = false,
    bool isDestructive = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: isDestructive ? Colors.red : AppColors.primaryBlack,
                size: 24.sp,
              ),
              SizedBox(width: 16.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: isDestructive ? Colors.red : AppColors.primaryBlack,
                ),
              ),
            ],
          ),
          if (isToggle)
            Switch(
              value: false,
              onChanged: (val) {},
              activeColor: AppColors.primaryBlack,
            )
          else
            Icon(Iconsax.arrow_right_3, size: 20.sp, color: AppColors.textGrey),
        ],
      ),
      )
    );
  }
}
