import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class ProblemCard extends StatelessWidget {
  final String title;
  final String difficulty;
  final String category;

  const ProblemCard({
    super.key,
    required this.title,
    required this.difficulty,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    Color difficultyColor;
    if (difficulty == 'Easy') {
      difficultyColor = Colors.green;
    } else if (difficulty == 'Medium') {
      difficultyColor = Colors.orange;
    } else {
      difficultyColor = Colors.red;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.inputFill),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: AppColors.inputFill,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(Iconsax.code, color: AppColors.primaryBlack),
                ),
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
                          color: AppColors.textBlack,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text(
                            category,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textGrey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            width: 4.w,
                            height: 4.w,
                            decoration: BoxDecoration(
                              color: AppColors.textLightGrey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            difficulty,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: difficultyColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(Iconsax.arrow_right_3, size: 20.sp, color: AppColors.textGrey),
        ],
      ),
    );
  }
}
