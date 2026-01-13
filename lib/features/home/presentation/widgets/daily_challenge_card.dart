import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/data/models/exercise_model.dart';

class DailyChallengeCard extends StatelessWidget {
  final Problem problem;
  final VoidCallback onTap;

  const DailyChallengeCard({
    super.key,
    required this.problem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        padding: EdgeInsets.all(24.r),
        decoration: BoxDecoration(
          color: AppColors.getPrimaryBlack(context),
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.getPrimaryBlack(context).withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.getPrimaryWhite(context).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.dailyChallenge,
                    style: TextStyle(
                      color: AppColors.getPrimaryWhite(context),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Iconsax.arrow_right_3,
                  color: AppColors.getPrimaryWhite(context),
                  size: 20.sp,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              problem.title,
              style: TextStyle(
                color: AppColors.getPrimaryWhite(context),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '${problem.difficulty} • ${problem.category}',
              style: TextStyle(
                color: AppColors.getPrimaryWhite(context).withOpacity(0.7),
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Daily Challenge Card that uses API data directly
class DailyChallengeCardFromApi extends StatelessWidget {
  final String title;
  final String difficulty;
  final String category;
  final int points;
  final bool isCompleted;
  final VoidCallback onTap;

  const DailyChallengeCardFromApi({
    super.key,
    required this.title,
    required this.difficulty,
    required this.category,
    required this.points,
    required this.isCompleted,
    required this.onTap,
  });

  Color _getDifficultyColor() {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'hard':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        padding: EdgeInsets.all(24.r),
        decoration: BoxDecoration(
          color: AppColors.getPrimaryBlack(context),
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.getPrimaryBlack(context).withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.getPrimaryWhite(
                          context,
                        ).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.dailyChallenge,
                        style: TextStyle(
                          color: AppColors.getPrimaryWhite(context),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (isCompleted) ...[
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Iconsax.tick_circle,
                              color: Colors.green,
                              size: 12.sp,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              AppLocalizations.of(context)!.completed,
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
                Icon(
                  Iconsax.arrow_right_3,
                  color: AppColors.getPrimaryWhite(context),
                  size: 20.sp,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              title,
              style: TextStyle(
                color: AppColors.getPrimaryWhite(context),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: _getDifficultyColor().withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    difficulty,
                    style: TextStyle(
                      color: _getDifficultyColor(),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  category,
                  style: TextStyle(
                    color: AppColors.getPrimaryWhite(context).withOpacity(0.7),
                    fontSize: 14.sp,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Iconsax.medal_star,
                        color: Colors.amber,
                        size: 14.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '+$points pts',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
