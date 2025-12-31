import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/data/models/exercise_model.dart';

class ProblemDescriptionTab extends StatelessWidget {
  final Problem problem;

  const ProblemDescriptionTab({super.key, required this.problem});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            problem.title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlack,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              _buildChip(
                problem.difficulty,
                _getDifficultyColor(problem.difficulty),
              ),
              if (problem.category != null) ...[
                SizedBox(width: 8.w),
                _buildChip(problem.category!, AppColors.textGrey),
              ],
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'Description',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlack,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            problem.content,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textBlack,
              height: 1.5,
            ),
          ),
          SizedBox(height: 24.h),
          // TODO: Add examples and constraints when available from backend
          if (problem.hint != null) ...[
            Text(
              'Hint',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBlack,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.inputFill,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                problem.hint!,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textBlack,
                  height: 1.5,
                ),
              ),
            ),
          ],
          SizedBox(height: 80.h),
        ],
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty) {
      case 'Easy':
        return Colors.green;
      case 'Medium':
        return Colors.orange;
      case 'Hard':
        return Colors.red;
      default:
        return AppColors.textBlack;
    }
  }
}
