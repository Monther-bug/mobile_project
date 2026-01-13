import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/notification_entity.dart';

class NotificationItem extends StatelessWidget {
  final NotificationEntity notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: notification.isRead
            ? Colors.transparent
            : AppColors.primaryBlack.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackground,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.border),
            ),
            child: Icon(
              Iconsax.notification,
              color: AppColors.primaryBlack,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  notification.body,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textGrey,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  DateFormat.yMMMd().add_jm().format(notification.createdAt),
                  style: TextStyle(fontSize: 12.sp, color: AppColors.textGrey),
                ),
              ],
            ),
          ),
          if (!notification.isRead)
            Container(
              margin: EdgeInsets.only(left: 8.w, top: 4.h),
              width: 8.r,
              height: 8.r,
              decoration: const BoxDecoration(
                color: AppColors.primaryBlack,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
