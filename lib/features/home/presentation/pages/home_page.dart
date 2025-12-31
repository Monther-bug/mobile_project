import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/home_widgets.dart';
import '../widgets/category_list.dart';
import '../widgets/recent_problems_list.dart';
import '../../../problems/presentation/pages/problem_detail_page.dart';
import '../../../problems/data/models/problem_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                userName: 'Manther', // Mock data
                onNotificationTap: () {},
              ),

              SizedBox(height: 12.h),

              DailyChallengeCard(
                problem: Problem.mockList[0],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProblemDetailPage(problem: Problem.mockList[0]),
                    ),
                  );
                },
              ),

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
      ),
    );
  }
}
