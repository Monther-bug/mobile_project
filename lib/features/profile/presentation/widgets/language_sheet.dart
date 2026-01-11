import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/l10n/locale_provider.dart';
import '../../../../core/theme/app_colors.dart';

class LanguageSheet extends StatelessWidget {
  final AppLocalizations l10n;

  const LanguageSheet({super.key, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: AppColors.getGlassBackground(context),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.selectLanguage,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.getPrimaryBlack(context),
                ),
              ),
              SizedBox(height: 24.h),
              _buildLangItem(
                context, 
                l10n.english, 
                'en',
                localeProvider.isEnglish,
                localeProvider,
              ),
              _buildLangItem(
                context, 
                l10n.arabic, 
                'ar',
                localeProvider.isArabic,
                localeProvider,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLangItem(
    BuildContext context, 
    String lang, 
    String localeCode,
    bool selected,
    LocaleProvider localeProvider,
  ) {
    return InkWell(
      onTap: () {
        localeProvider.setLocale(Locale(localeCode));
        Navigator.pop(context);
      },
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
                color: AppColors.getPrimaryBlack(context),
              ),
            ),
            if (selected)
              Icon(
                Iconsax.tick_circle,
                color: AppColors.getPrimaryBlack(context),
                size: 24.sp,
              ),
          ],
        ),
      ),
    );
  }
}
