import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../shared/widgets/shimmer_widgets.dart';
import '../../providers/category_provider.dart';
import 'category_chip.dart';

class CategoryList extends StatefulWidget {
  final String selectedCategory;

  const CategoryList({super.key, required this.selectedCategory});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryProvider>().fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                l10n.categories,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlack,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            if (categoryProvider.isLoading &&
                categoryProvider.categories.isEmpty)
              const CategoryChipsShimmer()
            else
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    // Always show 'All' category first
                    CategoryChip(
                      label: l10n.all,
                      isSelected: categoryProvider.selectedCategory == 'All',
                      onTap: () => categoryProvider.selectCategory('All'),
                    ),
                    // Show categories from API
                    ...categoryProvider.categories.map((category) {
                      return CategoryChip(
                        label: category.name,
                        isSelected:
                            categoryProvider.selectedCategory == category.name,
                        onTap: () =>
                            categoryProvider.selectCategory(category.name),
                        exerciseCount: category.exerciseCount,
                      );
                    }),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
