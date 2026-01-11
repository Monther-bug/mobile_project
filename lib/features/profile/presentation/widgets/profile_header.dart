import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/providers/auth_provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        final user = authProvider.user;
        final userName = user?.name ?? 'User';
        final userEmail = user?.email ?? 'email@example.com';

        return Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.inputFill,
                child: Text(
                  userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlack,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                userName,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlack,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                userEmail,
                style: TextStyle(fontSize: 14.sp, color: AppColors.textGrey),
              ),
            ],
          ),
        );
      },
    );
  }
}
