import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import 'category_chip.dart';

class CategoryList extends StatelessWidget {
  final String selectedCategory;

  const CategoryList({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlack,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              CategoryChip(label: 'All', isSelected: selectedCategory == 'All'),
              const CategoryChip(label: 'Arrays'),
              const CategoryChip(label: 'Dynamic Programming'),
              const CategoryChip(label: 'Graphs'),
              const CategoryChip(label: 'Trees'),
            ],
          ),
        ),
      ],
    );
  }
}
