import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/core/l10n/app_localizations.dart';
import 'package:final_mobile_project/core/constants/app_images.dart';
import 'package:final_mobile_project/features/onboarding/controllers/onboarding_controller.dart';
import 'package:final_mobile_project/features/onboarding/providers/onboarding_provider.dart';
import 'package:final_mobile_project/features/onboarding/presentation/views/onboarding_view.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  late OnboardingController _controller;
  late List<Map<String, String>> _onboardingData;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _initializeData();
      _isInitialized = true;
    }
  }

  void _initializeData() {
    final l10n = AppLocalizations.of(context)!;

    _onboardingData = [
      {
        "title": l10n.onboardingTitle1,
        "desc": l10n.onboardingDesc1,
        "image": AppImages.onboarding,
      },
      {
        "title": l10n.onboardingTitle2,
        "desc": l10n.onboardingDesc2,
        "image": AppImages.onboarding2,
      },
      {
        "title": l10n.onboardingTitle3,
        "desc": l10n.onboardingDesc3,
        "image": AppImages.onboarding3,
      },
    ];

    _controller = OnboardingController(
      context: context,
      pageController: _pageController,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Consumer<OnboardingProvider>(
      builder: (context, provider, child) {
        return OnboardingView(
          pageController: _pageController,
          currentPage: provider.currentPage,
          onboardingData: _onboardingData,
          onSkip: _controller.skip,
          onNext: () => _controller.nextPage(_onboardingData.length),
          skipText: l10n.skip,
          buttonText: provider.getButtonText(
            _onboardingData.length,
            l10n.next,
            l10n.getStarted,
          ),
          onPageChanged: _controller.onPageChanged,
        );
      },
    );
  }
}
