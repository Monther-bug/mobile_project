import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/data/models/exercise_model.dart';
import '../../../home/presentation/widgets/problem_card.dart';
import '../../../problems/presentation/pages/problem_detail_page.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Problem> _filteredProblems = [];

  @override
  void initState() {
    super.initState();
    _filteredProblems = Problem.mockList;
  }

  void _filterProblems(String query) {
    setState(() {
      _filteredProblems = Problem.mockList
          .where(
            (problem) =>
                problem.title.toLowerCase().contains(query.toLowerCase()) ||
                (problem.category?.toLowerCase() ?? '').contains(
                  query.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discover',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.inputFill,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterProblems,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search problems...',
                        hintStyle: TextStyle(color: AppColors.textGrey),
                        icon: Icon(
                          Iconsax.search_normal,
                          color: AppColors.primaryBlack,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemCount: _filteredProblems.length,
                itemBuilder: (context, index) {
                  final problem = _filteredProblems[index];
                  return GestureDetector(
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
                      category: problem.category ?? 'Unknown',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
