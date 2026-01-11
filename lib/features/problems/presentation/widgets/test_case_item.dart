import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/data/models/exercise_model.dart';

class TestCaseItem extends StatelessWidget {
  final TestCase testCase;

  const TestCaseItem({super.key, required this.testCase});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${l10n.input}:',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textGrey,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            testCase.input,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 14.sp,
              color: AppColors.textBlack,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '${l10n.expectedOutput}:',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textGrey,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            testCase.expectedOutput,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 14.sp,
              color: AppColors.textBlack,
            ),
          ),
        ],
      ),
    );
  }
}
