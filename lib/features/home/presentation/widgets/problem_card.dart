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
    String difficultyLower = difficulty.toLowerCase();

    if (difficultyLower == 'easy') {
      difficultyColor = Colors.green;
    } else if (difficultyLower == 'medium') {
      difficultyColor = Colors.orange;
    } else if (difficultyLower == 'hard') {
      difficultyColor = Colors.red;
    } else {
      difficultyColor = Colors.grey;
    }

    // Capitalize first letter for display
    String displayDifficulty = difficulty.isNotEmpty
        ? difficulty[0].toUpperCase() + difficulty.substring(1).toLowerCase()
        : difficulty;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.getGlassBackground(context),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: difficultyColor.withOpacity(0.3), width: 1.5),
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
                    color: AppColors.getInputFill(context),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Iconsax.code,
                    color: AppColors.getTextBlack(context),
                  ),
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
                          color: AppColors.getTextBlack(context),
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
                              color: AppColors.getTextGrey(context),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            width: 4.w,
                            height: 4.w,
                            decoration: BoxDecoration(
                              color: AppColors.getTextLightGrey(context),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            displayDifficulty,
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
          Icon(
            Iconsax.arrow_right_3,
            size: 20.sp,
            color: AppColors.getTextGrey(context),
          ),
        ],
      ),
    );
  }
}
