import 'package:flutter/material.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:final_mobile_project/core/theme/app_dimens.dart';
import 'package:final_mobile_project/core/theme/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppDimens.buttonHeight,
      decoration: BoxDecoration(
        color: AppColors.getPrimaryBlack(context),
        borderRadius: BorderRadius.circular(AppDimens.radius12),
        boxShadow: [
          BoxShadow(
            color: AppColors.getPrimaryBlack(context).withAlpha(50),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius12),
          ),
        ),
        child: Text(text.toUpperCase(), style: AppTextStyles.buttonText.copyWith(color: AppColors.getPrimaryWhite(context))),
      ),
    );
  }
}
