import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/shimmer_widgets.dart';
import '../../../home/data/models/exercise_model.dart';
import '../widgets/problem_description_tab.dart';
import '../widgets/problem_solution_tab.dart';

class ProblemDetailView extends StatelessWidget {
  final Problem problem;
  final bool isLoading;
  final String? errorMessage;
  final TabController tabController;
  final VoidCallback onBack;
  final VoidCallback onCodeTap;
  final VoidCallback onRetry;

  const ProblemDetailView({
    super.key,
    required this.problem,
    required this.isLoading,
    this.errorMessage,
    required this.tabController,
    required this.onBack,
    required this.onCodeTap,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: _buildAppBar(l10n),
      body: _buildBody(l10n),
    );
  }

  PreferredSizeWidget _buildAppBar(AppLocalizations l10n) {
    return AppBar(
      backgroundColor: AppColors.scaffoldBackground,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Iconsax.arrow_left, color: AppColors.primaryBlack),
        onPressed: onBack,
      ),
      title: Text(
        problem.title,
        style: TextStyle(
          color: AppColors.primaryBlack,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Iconsax.code, color: AppColors.primaryBlack),
          onPressed: onCodeTap,
        ),
      ],
      bottom: TabBar(
        controller: tabController,
        labelColor: AppColors.primaryBlack,
        unselectedLabelColor: AppColors.textGrey,
        indicatorColor: AppColors.primaryBlack,
        tabs: [
          Tab(text: l10n.description),
          Tab(text: l10n.solution),
        ],
      ),
    );
  }

  Widget _buildBody(AppLocalizations l10n) {
    if (isLoading) return const ProblemDetailShimmer();
    if (errorMessage != null) return _buildErrorState(l10n);
    return TabBarView(
      controller: tabController,
      children: [
        ProblemDescriptionTab(problem: problem),
        const ProblemSolutionTab(),
      ],
    );
  }

  Widget _buildErrorState(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.warning_2, size: 48.sp, color: AppColors.textGrey),
          SizedBox(height: 16.h),
          Text(l10n.failedToLoadProblems, style: TextStyle(fontSize: 16.sp)),
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
}
