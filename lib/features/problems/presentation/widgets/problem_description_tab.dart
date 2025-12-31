import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/problem_model.dart';
import 'problem_widgets.dart';

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
              SizedBox(width: 8.w),
              _buildChip(problem.category, AppColors.textGrey),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            problem.description,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textBlack,
              height: 1.5,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Examples',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlack,
            ),
          ),
          SizedBox(height: 12.h),
          ...problem.examples.asMap().entries.map((entry) {
            return ExampleCard(index: entry.key + 1, example: entry.value);
          }),
          SizedBox(height: 24.h),
          Text(
            'Constraints',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlack,
            ),
          ),
          SizedBox(height: 12.h),
          ConstraintList(constraints: problem.constraints),
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
