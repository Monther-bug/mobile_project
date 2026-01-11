import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_mobile_project/features/discover/presentation/widgets/filter_chip.dart' as custom;

class DifficultyFilter extends StatelessWidget {
  final String selectedDifficulty;
  final ValueChanged<String> onDifficultyChanged;

  const DifficultyFilter({
    super.key,
    required this.selectedDifficulty,
    required this.onDifficultyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          custom.FilterChip(
            label: 'All',
            isSelected: selectedDifficulty == 'All',
            onTap: () => onDifficultyChanged('All'),
          ),
          SizedBox(width: 8.w),
          custom.FilterChip(
            label: 'Easy',
            isSelected: selectedDifficulty == 'Easy',
            onTap: () => onDifficultyChanged('Easy'),
            color: Colors.green,
          ),
          SizedBox(width: 8.w),
          custom.FilterChip(
            label: 'Medium',
            isSelected: selectedDifficulty == 'Medium',
            onTap: () => onDifficultyChanged('Medium'),
            color: Colors.orange,
          ),
          SizedBox(width: 8.w),
          custom.FilterChip(
            label: 'Hard',
            isSelected: selectedDifficulty == 'Hard',
            onTap: () => onDifficultyChanged('Hard'),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
