import 'package:flutter/material.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:final_mobile_project/core/theme/app_dimens.dart';
import 'package:final_mobile_project/core/theme/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: AppTextStyles.inputText.copyWith(color: AppColors.getTextBlack(context)),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: AppColors.getTextGrey(context)),
        hintText: hintText,
        hintStyle: AppTextStyles.hintText.copyWith(color: AppColors.getTextLightGrey(context)),
        filled: true,
        fillColor: AppColors.getInputFill(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius12),
          borderSide: BorderSide(color: AppColors.getTextBlack(context), width: 1.5),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimens.inputPaddingHorizontal,
          vertical: AppDimens.inputPaddingVertical,
        ),
      ),
    );
  }
}
