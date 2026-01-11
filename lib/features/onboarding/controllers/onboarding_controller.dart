import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_router.dart';
import '../providers/onboarding_provider.dart';

class OnboardingController {
  final BuildContext context;
  final PageController pageController;

  OnboardingController({required this.context, required this.pageController});

  OnboardingProvider get _provider => context.read<OnboardingProvider>();

  Future<void> completeOnboarding() async {
    await _provider.completeOnboarding();

    if (context.mounted) {
      context.go(AppRoutes.login);
    }
  }

  void skip() {
    completeOnboarding();
  }

  void nextPage(int totalPages) {
    if (_provider.isLastPage(totalPages)) {
      completeOnboarding();
    } else {
      _provider.nextPage(pageController, totalPages);
    }
  }

  void onPageChanged(int page) {
    _provider.setCurrentPage(page);
  }

  void dispose() {
    pageController.dispose();
  }
}
