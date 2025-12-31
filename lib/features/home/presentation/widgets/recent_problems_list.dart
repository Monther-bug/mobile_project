import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../problems/presentation/pages/problem_detail_page.dart';
import '../../../problems/data/models/problem_model.dart';
import 'problem_card.dart';

class RecentProblemsList extends StatelessWidget {
  const RecentProblemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Problems',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(color: AppColors.textGrey, fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: Problem.mockList
                .map(
                  (problem) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProblemDetailPage(problem: problem),
                        ),
                      );
                    },
                    child: ProblemCard(
                      title: problem.title,
                      difficulty: problem.difficulty,
                      category: problem.category,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
