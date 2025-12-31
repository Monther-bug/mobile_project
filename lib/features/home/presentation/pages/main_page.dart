import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import 'home_page.dart';
import '../../../discover/presentation/pages/discover_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const DiscoverPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.inputFill)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => _onItemTapped(0),
              child: _buildNavItem(Iconsax.home_15, _selectedIndex == 0),
            ),
            InkWell(
              onTap: () => _onItemTapped(1),
              child: _buildNavItem(Iconsax.radar_2, _selectedIndex == 1),
            ),
            InkWell(
              onTap: () => _onItemTapped(2),
              child: _buildNavItem(Iconsax.user, _selectedIndex == 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 28.sp,
          color: isSelected ? AppColors.primaryBlack : AppColors.textLightGrey,
        ),
        if (isSelected)
          Container(
            margin: EdgeInsets.only(top: 4.h),
            width: 4.w,
            height: 4.w,
            decoration: BoxDecoration(
              color: AppColors.primaryBlack,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
