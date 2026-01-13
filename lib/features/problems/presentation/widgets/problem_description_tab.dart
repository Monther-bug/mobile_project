import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/data/models/exercise_model.dart';
import '../../providers/problem_provider.dart';
import 'problem_header.dart';
import 'test_case_item.dart';
import 'hint_section.dart';

class ProblemDescriptionTab extends StatelessWidget {
  final Problem problem;

  const ProblemDescriptionTab({super.key, required this.problem});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<ProblemProvider>(
      builder: (context, provider, child) {
        final displayProblem = provider.currentProblem ?? problem;
        return SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProblemHeader(problem: displayProblem),
              SizedBox(height: 24.h),
              _buildDescription(context, l10n, displayProblem),
              SizedBox(height: 24.h),
              _buildTestCases(context, l10n, displayProblem),
              _buildHintSection(displayProblem, provider),
              SizedBox(height: 80.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDescription(
    BuildContext context,
    AppLocalizations l10n,
    Problem displayProblem,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.description,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.getPrimaryBlack(context),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          displayProblem.content,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.getTextBlack(context),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildTestCases(
    BuildContext context,
    AppLocalizations l10n,
    Problem displayProblem,
  ) {
    if (displayProblem.testCases == null || displayProblem.testCases!.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.testCases,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.getPrimaryBlack(context),
          ),
        ),
        SizedBox(height: 12.h),
        ...displayProblem.testCases!
            .take(2)
            .map((tc) => TestCaseItem(testCase: tc)),
        SizedBox(height: 12.h),
      ],
    );
  }

  Widget _buildHintSection(Problem displayProblem, ProblemProvider provider) {
    if (displayProblem.hint != null && displayProblem.hint!.isNotEmpty) {
      return HintSection(hint: displayProblem.hint!);
    }
    return GetHintButton(provider: provider, problemId: problem.id);
  }
}
