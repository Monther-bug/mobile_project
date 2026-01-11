import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/l10n/app_localizations.dart';
import 'home_page.dart';
import '../../../discover/presentation/pages/discover_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../profile/presentation/pages/leaderboard_page.dart';
import '../../../profile/presentation/pages/history_page.dart';
import '../widgets/animated_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _scaleAnimations;

  final List<Widget> _pages = [
    const HomePage(),
    const DiscoverPage(),
    const LeaderboardPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _animationControllers = List.generate(
      5,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      ),
    );
    _scaleAnimations = _animationControllers.map((controller) {
      return Tween<double>(begin: 1.0, end: 0.85).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    
    _animationControllers[index].forward().then((_) {
      _animationControllers[index].reverse();
    });
    
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final navItems = [
      NavItemData(icon: Iconsax.home_15, label: l10n.home),
      NavItemData(icon: Iconsax.radar_2, label: l10n.discover),
      NavItemData(icon: Iconsax.cup, label: l10n.ranking),
      NavItemData(icon: Iconsax.document, label: l10n.history),
      NavItemData(icon: Iconsax.user, label: l10n.profile),
    ];
    
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(_selectedIndex),
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: AnimatedNavBar(
        items: navItems,
        selectedIndex: _selectedIndex,
        scaleAnimations: _scaleAnimations,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
