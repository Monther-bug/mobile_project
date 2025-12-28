import 'package:flutter/material.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle get heading1 => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
    letterSpacing: 1.2,
  );

  static TextStyle get subtitle =>
      TextStyle(fontSize: 16.sp, color: AppColors.textGrey);

  static TextStyle get buttonText => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Colors.white,
  );

  static TextStyle get inputText => TextStyle(
    fontSize: 14.sp,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get hintText =>
      TextStyle(fontSize: 14.sp, color: AppColors.textLightGrey);

  static TextStyle get linkText => TextStyle(
    fontSize: 14.sp,
    color: AppColors.textBlack,
    fontWeight: FontWeight.bold,
  );
}
