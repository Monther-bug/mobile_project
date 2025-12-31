import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/data/models/exercise_model.dart';
import '../../providers/problem_provider.dart';
import '../widgets/problem_description_tab.dart';
import '../widgets/problem_solution_tab.dart';

class ProblemDetailPage extends StatefulWidget {
  final Problem problem;

  const ProblemDetailPage({super.key, required this.problem});

  @override
  State<ProblemDetailPage> createState() => _ProblemDetailPageState();
}

class _ProblemDetailPageState extends State<ProblemDetailPage> {
  @override
  void initState() {
    super.initState();
    // Set the problem in provider when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProblemProvider>().setProblem(widget.problem);

      // Optionally fetch fresh data from API
      // context.read<ProblemProvider>().fetchProblemById(widget.problem.id);
    });
  }

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
            icon: const Icon(Iconsax.arrow_left, color: AppColors.primaryBlack),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            widget.problem.title,
            style: TextStyle(
              color: AppColors.primaryBlack,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Iconsax.play, color: AppColors.primaryBlack),
              onPressed: () {
                // TODO: Run code
              },
            ),
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
        body: Consumer<ProblemProvider>(
          builder: (context, problemProvider, child) {
            // Show loading if fetching fresh data
            if (problemProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Show error if any
            if (problemProvider.errorMessage != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error loading problem',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      problemProvider.errorMessage!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () =>
                          problemProvider.fetchProblemById(widget.problem.id),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            // Use current problem from provider or fallback to widget problem
            final displayProblem =
                problemProvider.currentProblem ?? widget.problem;

            return TabBarView(
              children: [
                ProblemDescriptionTab(problem: displayProblem),
                const ProblemSolutionTab(),
              ],
            );
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackground,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              // TODO: Submit solution
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlack,
              foregroundColor: AppColors.primaryWhite,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
