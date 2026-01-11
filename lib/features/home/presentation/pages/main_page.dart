import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import 'home_page.dart';
import '../../../discover/presentation/pages/discover_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../profile/presentation/pages/leaderboard_page.dart';
import '../../../profile/presentation/pages/history_page.dart';

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
    const LeaderboardPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
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
              child: _buildNavItem(
                Iconsax.home_15,
                l10n.home,
                _selectedIndex == 0,
              ),
            ),
            InkWell(
              onTap: () => _onItemTapped(1),
              child: _buildNavItem(
                Iconsax.radar_2,
                l10n.discover,
                _selectedIndex == 1,
              ),
            ),
            InkWell(
              onTap: () => _onItemTapped(2),
              child: _buildNavItem(Iconsax.cup, l10n.ranking, _selectedIndex == 2),
            ),
            InkWell(
              onTap: () => _onItemTapped(3),
              child: _buildNavItem(
                Iconsax.document,
                l10n.history,
                _selectedIndex == 3,
              ),
            ),
            InkWell(
              onTap: () => _onItemTapped(4),
              child: _buildNavItem(
                Iconsax.user,
                l10n.profile,
                _selectedIndex == 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 20.sp,
          color: isSelected ? AppColors.primaryBlack : AppColors.textLightGrey,
        ),
        if (isSelected) ...[
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 8.sp,
              color: AppColors.primaryBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}
