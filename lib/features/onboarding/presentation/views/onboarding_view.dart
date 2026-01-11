import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import '../widgets/onboarding_content.dart';

class OnboardingView extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final List<Map<String, String>> onboardingData;
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final String skipText;
  final String buttonText;
  final ValueChanged<int> onPageChanged;

  const OnboardingView({
    super.key,
    required this.pageController,
    required this.currentPage,
    required this.onboardingData,
    required this.onSkip,
    required this.onNext,
    required this.skipText,
    required this.buttonText,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [_buildPageView(), _buildBottomSection()]),
      ),
    );
  }

  Widget _buildPageView() {
    return Expanded(
      flex: 3,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: onboardingData.length,
        itemBuilder: (context, index) => OnboardingContent(
          image: onboardingData[index]["image"]!,
          title: onboardingData[index]["title"]!,
          description: onboardingData[index]["desc"]!,
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            _buildDotIndicators(),
            const Spacer(),
            _buildButtons(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingData.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.only(right: 6.w),
          height: 8.h,
          width: currentPage == index ? 24.w : 8.w,
          decoration: BoxDecoration(
            color: currentPage == index
                ? AppColors.primaryBlack
                : AppColors.textGrey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onSkip,
          child: Text(
            skipText,
            style: TextStyle(fontSize: 16.sp, color: AppColors.textGrey),
          ),
        ),
        ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlack,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
