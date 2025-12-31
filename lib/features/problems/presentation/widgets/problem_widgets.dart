import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/problem_model.dart';

class ExampleCard extends StatelessWidget {
  final int index;
  final ProblemExample example;

  const ExampleCard({super.key, required this.index, required this.example});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Example $index:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: AppColors.primaryBlack,
            ),
          ),
          SizedBox(height: 8.h),
          _buildRichText('Input: ', example.input),
          SizedBox(height: 4.h),
          _buildRichText('Output: ', example.output),
          if (example.explanation != null) ...[
            SizedBox(height: 4.h),
            _buildRichText('Explanation: ', example.explanation!),
          ],
        ],
      ),
    );
  }

  Widget _buildRichText(String label, String content) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.textBlack,
          fontFamily: 'Roboto', // Or your app's font
        ),
        children: [
          TextSpan(
            text: label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: content,
            style: TextStyle(
              fontFamily: 'Courier', // Monospace for code/data
              color: AppColors.textGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class ConstraintList extends StatelessWidget {
  final List<String> constraints;

  const ConstraintList({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: constraints.map((constraint) {
        return Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 6.h, right: 8.w),
                width: 4.w,
                height: 4.w,
                decoration: BoxDecoration(
                  color: AppColors.textGrey,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Text(
                  constraint,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textBlack,
                    fontFamily: 'Courier',
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
