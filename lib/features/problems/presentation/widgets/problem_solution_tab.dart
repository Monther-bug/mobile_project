import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class ProblemSolutionTab extends StatefulWidget {
  const ProblemSolutionTab({super.key});

  @override
  State<ProblemSolutionTab> createState() => _ProblemSolutionTabState();
}

class _ProblemSolutionTabState extends State<ProblemSolutionTab> {
  String _selectedLanguage = 'Dart';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          color: AppColors.inputFill,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                value: _selectedLanguage,
                underline: const SizedBox(),
                items: ['Dart', 'Python', 'Java', 'C++'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                  });
                },
              ),
              Icon(Iconsax.setting_2, size: 20.sp, color: AppColors.textGrey),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(24.w),
            child: TextField(
              maxLines: null,
              expands: true,
              style: TextStyle(fontFamily: 'Courier', fontSize: 14.sp),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '// Write your code here...',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
