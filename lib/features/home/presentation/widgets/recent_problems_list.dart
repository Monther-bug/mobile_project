import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/routes/app_router.dart';
import '../../data/models/exercise_model.dart';
import '../../providers/exercise_provider.dart';
import 'problem_card.dart';

class RecentProblemsList extends StatelessWidget {
  const RecentProblemsList({super.key});

  List<Problem> _getProblemsFromExercises(List<Exercise> exercises) {
    List<Problem> allProblems = [];
    for (var exercise in exercises) {
      if (exercise.problems != null) {
        for (var problem in exercise.problems!) {
          allProblems.add(
            Problem(
              id: problem.id,
              exerciseId: problem.exerciseId,
              title: problem.title,
              content: problem.content,
              difficulty: problem.difficulty,
              hint: problem.hint,
              category: exercise.category,
              testCases: problem.testCases,
              createdAt: problem.createdAt,
              updatedAt: problem.updatedAt,
            ),
          );
        }
      }
    }
    return allProblems.take(6).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Consumer<ExerciseProvider>(
      builder: (context, exerciseProvider, child) {
        final problems = _getProblemsFromExercises(exerciseProvider.exercises);

        if (problems.isEmpty && !exerciseProvider.isLoading) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.recentProblems,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlack,
                  ),
                ),
                SizedBox(height: 16.h),
                Center(
                  child: Text(
                    l10n.noProblemsAvailable,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textGrey,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.recentProblems,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to Discover tab (index 1)
                      // Using DefaultTabController if available, or just show message
                    },
                    child: Text(
                      l10n.seeAll,
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: problems
                    .map(
                      (problem) => GestureDetector(
                        onTap: () {
                          context.push(AppRoutes.problemDetail, extra: problem);
                        },
                        child: ProblemCard(
                          title: problem.title,
                          difficulty: problem.difficulty,
                          category: problem.category ?? 'Unknown',
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
