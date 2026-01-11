import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

class NavItemData {
  final IconData icon;
  final String label;

  NavItemData({required this.icon, required this.label});
}

class AnimatedNavBar extends StatelessWidget {
  final List<NavItemData> items;
  final int selectedIndex;
  final List<Animation<double>> scaleAnimations;
  final Function(int) onItemTapped;

  const AnimatedNavBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.scaleAnimations,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.getGlassBackground(context),
        boxShadow: [
          BoxShadow(
            color: AppColors.getShadow(context),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            return AnimatedNavItem(
              icon: items[index].icon,
              label: items[index].label,
              isSelected: selectedIndex == index,
              scaleAnimation: scaleAnimations[index],
              onTap: () => onItemTapped(index),
            );
          }),
        ),
      ),
    );
  }
}

class AnimatedNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Animation<double> scaleAnimation;
  final VoidCallback onTap;

  const AnimatedNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.scaleAnimation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 16.w : 12.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color: isSelected 
                ? AppColors.getPrimaryBlack(context).withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: isSelected ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  icon,
                  size: 22.sp,
                  color: isSelected 
                      ? AppColors.getPrimaryBlack(context) 
                      : AppColors.getTextLightGrey(context),
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: isSelected
                    ? Row(
                        children: [
                          SizedBox(width: 8.w),
                          AnimatedOpacity(
                            opacity: isSelected ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 200),
                            child: Text(
                              label,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.getPrimaryBlack(context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
