import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../providers/problem_provider.dart';

class HintSection extends StatelessWidget {
  final String hint;

  const HintSection({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.hint,
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
            color: Colors.amber.shade50,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.amber.shade200),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Iconsax.lamp_on, color: Colors.amber.shade700, size: 20.sp),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  hint,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textBlack,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GetHintButton extends StatelessWidget {
  final ProblemProvider provider;
  final int problemId;

  const GetHintButton({
    super.key,
    required this.provider,
    required this.problemId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: provider.isLoadingHint
          ? null
          : () => provider.fetchHint(problemId),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.inputFill,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.textLightGrey.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (provider.isLoadingHint)
              SizedBox(
                width: 20.w,
                height: 20.h,
                child: const CircularProgressIndicator(strokeWidth: 2),
              )
            else
              Icon(Iconsax.lamp_on, color: AppColors.primaryBlack, size: 20.sp),
            SizedBox(width: 12.w),
            Text(
              provider.isLoadingHint ? 'Loading...' : 'Get Hint',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
