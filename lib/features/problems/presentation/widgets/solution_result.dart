import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/solution_model.dart';

class SolutionErrorMessage extends StatelessWidget {
  final String message;

  const SolutionErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.red.shade700, fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}

class SolutionResultMessage extends StatelessWidget {
  final Solution solution;

  const SolutionResultMessage({super.key, required this.solution});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isPassed = solution.isPassed;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isPassed ? Colors.green.shade50 : Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isPassed ? Colors.green.shade200 : Colors.orange.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isPassed ? Icons.check_circle_outline : Icons.info_outline,
                color: isPassed
                    ? Colors.green.shade700
                    : Colors.orange.shade700,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  isPassed
                      ? l10n.solutionPassed
                      : '${l10n.solutionStatus}: ${solution.status}',
                  style: TextStyle(
                    color: isPassed
                        ? Colors.green.shade700
                        : Colors.orange.shade700,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (solution.output != null) ...[
            SizedBox(height: 12.h),
            Text(
              '${l10n.output}:',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                solution.output!,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12.sp,
                  color: AppColors.textBlack,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
