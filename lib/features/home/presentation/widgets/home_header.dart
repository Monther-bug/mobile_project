import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final VoidCallback? onNotificationTap;

  const HomeHeader({super.key, required this.userName, this.onNotificationTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.inputFill,
                child: Icon(
                  Iconsax.user,
                  color: AppColors.primaryBlack,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.primaryBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: onNotificationTap,
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.inputFill),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Iconsax.notification, size: 22.sp),
            ),
          ),
        ],
      ),
    );
  }
}
