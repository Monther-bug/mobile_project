import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';

class LanguageSheet extends StatelessWidget {
  final AppLocalizations l10n;

  const LanguageSheet({super.key, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.selectLanguage,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlack,
            ),
          ),
          SizedBox(height: 24.h),
          _buildLangItem(context, l10n.english, false),
          _buildLangItem(context, l10n.arabic, true),
        ],
      ),
    );
  }

  Widget _buildLangItem(BuildContext context, String lang, bool selected) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lang,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: AppColors.primaryBlack,
              ),
            ),
            if (selected)
              Icon(
                Iconsax.tick_circle,
                color: AppColors.primaryBlack,
                size: 24.sp,
              ),
          ],
        ),
      ),
    );
  }
}
