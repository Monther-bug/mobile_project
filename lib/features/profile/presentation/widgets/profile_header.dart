import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.inputFill,
            child: Icon(
              Iconsax.user,
              size: 50.sp,
              color: AppColors.primaryBlack,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Manther',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlack,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'alex@example.com',
            style: TextStyle(fontSize: 14.sp, color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }
}
