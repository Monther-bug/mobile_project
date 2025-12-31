import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/data/models/exercise_model.dart';
import '../widgets/problem_description_tab.dart';
import '../widgets/problem_solution_tab.dart';

class ProblemDetailPage extends StatelessWidget {
  final Problem problem;

  const ProblemDetailPage({super.key, required this.problem});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackground,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Iconsax.arrow_left_2, color: AppColors.primaryBlack),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(Iconsax.play, color: AppColors.primaryBlack),
              onPressed: () {
                // Run Code
              },
            ),
            SizedBox(width: 8.w),
          ],
          bottom: TabBar(
            labelColor: AppColors.primaryBlack,
            unselectedLabelColor: AppColors.textGrey,
            indicatorColor: AppColors.primaryBlack,
            tabs: const [
              Tab(text: 'Description'),
              Tab(text: 'Solution'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProblemDescriptionTab(problem: problem),
            const ProblemSolutionTab(),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlack,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
