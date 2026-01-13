import 'package:flutter/material.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:final_mobile_project/core/theme/app_text_styles.dart';

class AuthFooterLink extends StatelessWidget {
  final String message;
  final String actionText;
  final VoidCallback onAction;

  const AuthFooterLink({
    super.key,
    required this.message,
    required this.actionText,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message, style: TextStyle(color: AppColors.getTextGrey(context))),
        TextButton(
          onPressed: onAction,
          child: Text(
            actionText,
            style: AppTextStyles.linkText.copyWith(
              color: AppColors.getTextBlack(context),
            ),
          ),
        ),
      ],
    );
  }
}
