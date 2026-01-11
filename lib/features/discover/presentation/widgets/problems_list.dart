import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:final_mobile_project/core/l10n/app_localizations.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:final_mobile_project/features/home/data/models/exercise_model.dart';
import 'package:final_mobile_project/features/home/presentation/widgets/problem_card.dart';
import 'package:final_mobile_project/shared/widgets/shimmer_widgets.dart';

class ProblemsList extends StatelessWidget {
  final List<Problem> problems;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onRetry;
  final Future<void> Function() onRefresh;
  final void Function(Problem problem) onProblemTap;

  const ProblemsList({
    super.key,
    required this.problems,
    required this.isLoading,
    this.errorMessage,
    required this.onRetry,
    required this.onRefresh,
    required this.onProblemTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (isLoading && problems.isEmpty) {
      return const ProblemsListShimmer();
    }

    // Error state
    if (errorMessage != null && problems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.warning_2,
              size: 48.sp,
              color: AppColors.textGrey,
            ),
            SizedBox(height: 16.h),
            Text(
              l10n.failedToLoadProblems,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.textGrey,
              ),
            ),
            SizedBox(height: 8.h),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    
    if (problems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.document,
              size: 48.sp,
              color: AppColors.textGrey,
            ),
            SizedBox(height: 16.h),
            Text(
              l10n.noProblemsFound,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: problems.length,
        itemBuilder: (context, index) {
          final problem = problems[index];
          return GestureDetector(
            onTap: () => onProblemTap(problem),
            child: ProblemCard(
              title: problem.title,
              difficulty: problem.difficulty,
              category: problem.category ?? 'Unknown',
            ),
          );
        },
      ),
    );
  }
}
