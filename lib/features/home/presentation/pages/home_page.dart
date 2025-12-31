import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/home_widgets.dart';
import '../widgets/category_list.dart';
import '../widgets/recent_problems_list.dart';
import '../../providers/exercise_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    // Fetch exercises when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ExerciseProvider>().fetchExercises(refresh: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Consumer<ExerciseProvider>(
          builder: (context, exerciseProvider, child) {
            // Show loading indicator on first load
            if (exerciseProvider.isLoading &&
                exerciseProvider.exercises.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (exerciseProvider.errorMessage != null &&
                exerciseProvider.exercises.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error loading exercises',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      exerciseProvider.errorMessage!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () =>
                          exerciseProvider.fetchExercises(refresh: true),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () => exerciseProvider.fetchExercises(refresh: true),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(
                      userName: 'Manther', // TODO: Get from AuthProvider
                      onNotificationTap: () {},
                    ),

                    SizedBox(height: 12.h),

                    // Show daily challenge if we have exercises with problems
                    if (exerciseProvider.exercises.isNotEmpty)
                      _buildDailyChallengeSection(exerciseProvider),

                    SizedBox(height: 24.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        children: [
                          const StatCard(
                            label: 'Problems Solved',
                            value: '142',
                            icon: Iconsax.tick_circle,
                          ),
                          SizedBox(width: 16.w),
                          const StatCard(
                            label: 'Current Streak',
                            value: '7 Days',
                            icon: Iconsax.trend_up,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),

                    CategoryList(selectedCategory: _selectedCategory),

                    SizedBox(height: 32.h),

                    const RecentProblemsList(),

                    SizedBox(height: 80.h), // Bottom padding for FAB/Nav
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDailyChallengeSection(ExerciseProvider provider) {
    // Find first exercise with problems
    final exerciseWithProblems = provider.exercises.firstWhere(
      (e) => e.problems != null && e.problems!.isNotEmpty,
      orElse: () => provider.exercises.first,
    );

    if (exerciseWithProblems.problems != null &&
        exerciseWithProblems.problems!.isNotEmpty) {
      final problem = exerciseWithProblems.problems!.first;
      return DailyChallengeCard(
        problem: problem,
        onTap: () {
          // Navigate to problem detail
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ProblemDetailPage(problem: problem),
          //   ),
          // );
        },
      );
    }

    return const SizedBox.shrink();
  }
}
