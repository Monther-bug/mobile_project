import 'package:flutter/material.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.getScaffoldBackground(context),
      child: SafeArea(child: child),
    );
  }
}
