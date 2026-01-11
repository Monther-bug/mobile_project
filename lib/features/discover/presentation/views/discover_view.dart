import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/core/l10n/app_localizations.dart';
import 'package:final_mobile_project/core/routes/app_router.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:final_mobile_project/core/theme/app_dimens.dart';
import 'package:final_mobile_project/core/theme/app_text_styles.dart';
import 'package:final_mobile_project/features/discover/presentation/widgets/category_filter.dart';
import 'package:final_mobile_project/features/discover/presentation/widgets/difficulty_filter.dart';
import 'package:final_mobile_project/features/discover/presentation/widgets/problems_list.dart';
import 'package:final_mobile_project/features/discover/presentation/widgets/search_bar.dart' as custom;
import 'package:final_mobile_project/features/discover/providers/discover_provider.dart';
import 'package:final_mobile_project/features/home/data/models/exercise_model.dart';
import 'package:final_mobile_project/features/home/providers/exercise_provider.dart';

class DiscoverView extends StatelessWidget {
  final TextEditingController searchController;

  const DiscoverView({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Consumer2<ExerciseProvider, DiscoverProvider>(
          builder: (context, exerciseProvider, discoverProvider, child) {
            final filteredProblems = discoverProvider.getFilteredProblems(
              exerciseProvider.exercises,
            );
            final categories = discoverProvider.getCategories(
              exerciseProvider.exercises,
            );

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(AppDimens.pagePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.discover,
                        style: AppTextStyles.heading1,
                      ),
                      SizedBox(height: AppDimens.spacing16),
                      custom.SearchBar(
                        controller: searchController,
                        onChanged: (value) {
                          discoverProvider.setSearchQuery(value);
                        },
                      ),
                      SizedBox(height: AppDimens.spacing16),
                      DifficultyFilter(
                        selectedDifficulty: discoverProvider.selectedDifficulty,
                        onDifficultyChanged: (difficulty) {
                          discoverProvider.setDifficulty(difficulty);
                        },
                      ),
                      SizedBox(height: AppDimens.spacing12),
                      CategoryFilter(
                        categories: categories,
                        selectedCategory: discoverProvider.selectedCategory,
                        onCategoryChanged: (category) {
                          discoverProvider.setCategory(category);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ProblemsList(
                    problems: filteredProblems,
                    isLoading: exerciseProvider.isLoading,
                    errorMessage: exerciseProvider.errorMessage,
                    onRetry: () => exerciseProvider.fetchExercises(refresh: true),
                    onRefresh: () => exerciseProvider.fetchExercises(refresh: true),
                    onProblemTap: (problem) => _navigateToProblem(context, problem),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _navigateToProblem(BuildContext context, Problem problem) {
    context.push(AppRoutes.problemDetail, extra: problem);
  }
}
