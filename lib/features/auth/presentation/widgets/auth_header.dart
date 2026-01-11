import 'package:flutter/material.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:final_mobile_project/core/theme/app_dimens.dart';
import 'package:final_mobile_project/core/theme/app_text_styles.dart';
import 'package:iconsax/iconsax.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showLogo;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.showLogo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showLogo) ...[
          Icon(
            Iconsax.code,
            size: AppDimens.iconLarge,
            color: AppColors.textBlack,
          ),
          SizedBox(height: AppDimens.spacing16),
        ],
        Text(title, style: AppTextStyles.heading1),
        SizedBox(height: AppDimens.spacing8),
        Text(subtitle, style: AppTextStyles.subtitle),
      ],
    );
  }
}
