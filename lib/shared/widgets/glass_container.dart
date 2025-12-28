import 'package:flutter/material.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:final_mobile_project/core/theme/app_dimens.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const GlassContainer({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(AppDimens.containerPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimens.radius20),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: AppDimens.blurRadius,
            offset: Offset(0, AppDimens.shadowOffsetY),
          ),
        ],
      ),
      child: child,
    );
  }
}
