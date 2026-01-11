import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../shared/widgets/shimmer_widgets.dart';
import '../widgets/home_header.dart';
import '../widgets/stat_card.dart';
import '../widgets/category_list.dart';
import '../widgets/recent_problems_list.dart';
import '../widgets/daily_challenge_section.dart';
import '../../data/models/exercise_model.dart';
import '../../../profile/data/models/profile_models.dart';
import '../../data/models/daily_challenge_model.dart';

class HomeView extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final String userName;
  final UserStats? stats;
  final DailyChallenge? dailyChallenge;
  final bool isDailyChallengeLoading;
  final VoidCallback onRetry;
  final Future<void> Function() onRefresh;
  final void Function(Problem problem) onDailyChallengeTap;

  const HomeView({
    super.key,
    required this.isLoading,
    this.errorMessage,
    required this.userName,
    this.stats,
    this.dailyChallenge,
    required this.isDailyChallengeLoading,
    required this.onRetry,
    required this.onRefresh,
    required this.onDailyChallengeTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (isLoading) {
      return const HomePageShimmer();
    }

    if (errorMessage != null) {
      return _buildErrorState(context, l10n);
    }

    return _buildContent(context, l10n);
  }

  Widget _buildErrorState(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.warning_2, size: 48.sp, color: AppColors.textGrey),
          SizedBox(height: 16.h),
          Text(l10n.errorLoadingExercises, style: TextStyle(fontSize: 16.sp)),
          SizedBox(height: 8.h),
          Text(
            errorMessage!,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textGrey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(onPressed: onRetry, child: Text(l10n.retry)),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, AppLocalizations l10n) {
    final problemsSolved = stats?.problemsSolved.toString() ?? '--';
    final streakLabel = stats?.streakLabel ?? '--';

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(userName: userName, onNotificationTap: () {}),

            SizedBox(height: 12.h),

            DailyChallengeSection(
              dailyChallenge: dailyChallenge,
              isLoading: isDailyChallengeLoading,
              onTap: onDailyChallengeTap,
            ),

            SizedBox(height: 24.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  StatCard(
                    label: l10n.problemsSolved,
                    value: problemsSolved,
                    icon: Iconsax.tick_circle,
                  ),
                  SizedBox(width: 16.w),
                  StatCard(
                    label: l10n.currentStreak,
                    value: streakLabel,
                    icon: Iconsax.trend_up,
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            
            const CategoryList(selectedCategory: 'All'),

            SizedBox(height: 32.h),


            const RecentProblemsList(),

            SizedBox(height: 50.h),  
          ],
        ),
      ),
    );
  }
}
