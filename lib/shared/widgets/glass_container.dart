import 'package:flutter/material.dart';

import 'package:final_mobile_project/core/theme/app_dimens.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const GlassContainer({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(AppDimens.containerPadding),
      decoration: BoxDecoration(
        color: AppColors.getGlassBackground(context),
        borderRadius: BorderRadius.circular(AppDimens.radius20),
      ),
      child: child,
    );
  }
}
