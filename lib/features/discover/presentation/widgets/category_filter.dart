import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_mobile_project/features/discover/presentation/widgets/filter_chip.dart' as custom;

class CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;

  const CategoryFilter({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (categories.length <= 1) {
      return const SizedBox.shrink();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map(
              (category) => Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: custom.FilterChip(
                  label: category,
                  isSelected: selectedCategory == category,
                  onTap: () => onCategoryChanged(category),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
