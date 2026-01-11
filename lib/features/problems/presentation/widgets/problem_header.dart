import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/data/models/exercise_model.dart';

class ProblemHeader extends StatelessWidget {
  final Problem problem;

  const ProblemHeader({super.key, required this.problem});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            _buildChip(problem.difficulty, _getDifficultyColor(problem.difficulty)),
            if (problem.category != null) ...[
              SizedBox(width: 8.w),
              _buildChip(problem.category!, AppColors.textGrey),
            ],
          ],
        ),
      ],
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
        style: TextStyle(color: color, fontSize: 12.sp, fontWeight: FontWeight.w600),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'hard':
        return Colors.red;
      default:
        return AppColors.textBlack;
    }
  }
}
