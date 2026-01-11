import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:final_mobile_project/core/l10n/app_localizations.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:final_mobile_project/core/theme/app_dimens.dart';
import 'package:final_mobile_project/core/theme/app_text_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
          ),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: EdgeInsets.all(AppDimens.spacing24),
                  decoration: BoxDecoration(
                    color: AppColors.textBlack,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textBlack.withAlpha(51),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(
                    Iconsax.code,
                    size: AppDimens.iconLarge,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppDimens.spacing24),
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)?.appTitle ?? 'Coding Practice',
                      style: AppTextStyles.heading1.copyWith(
                        color: AppColors.textBlack,
                      ),
                    ),
                    SizedBox(height: AppDimens.spacing8),
                    Text(
                      AppLocalizations.of(context)?.masterYourSkills ??
                          'Master your coding skills',
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
