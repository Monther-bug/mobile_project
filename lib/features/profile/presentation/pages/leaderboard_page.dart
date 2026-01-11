import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../providers/profile_provider.dart';
import '../../data/models/profile_models.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().fetchLeaderboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          l10n.leaderboard,
          style: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) {
          if (provider.isLoadingLeaderboard) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null && provider.leaderboard.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.warning_2,
                    size: 64.sp,
                    color: AppColors.textGrey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    l10n.failedToLoadLeaderboard,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textGrey,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ElevatedButton(
                    onPressed: () => provider.fetchLeaderboard(),
                    child: Text(l10n.retry),
                  ),
                ],
              ),
            );
          }

          if (provider.leaderboard.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.cup, size: 64.sp, color: AppColors.textGrey),
                  SizedBox(height: 16.h),
                  Text(
                    l10n.noLeaderboardData,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => provider.fetchLeaderboard(),
            child: ListView.builder(
              padding: EdgeInsets.all(24.w),
              itemCount: provider.leaderboard.length,
              itemBuilder: (context, index) {
                final entry = provider.leaderboard[index];
                return _buildLeaderboardItem(entry, index);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLeaderboardItem(LeaderboardEntry entry, int index) {
    final isTopThree = index < 3;
    final rankColors = [
      const Color(0xFFFFD700), // Gold
      const Color(0xFFC0C0C0), // Silver
      const Color(0xFFCD7F32), // Bronze
    ];

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isTopThree
            ? rankColors[index].withOpacity(0.1)
            : AppColors.inputFill,
        borderRadius: BorderRadius.circular(16.r),
        border: isTopThree
            ? Border.all(color: rankColors[index].withOpacity(0.3), width: 2)
            : null,
      ),
      child: Row(
        children: [
          // Rank
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: isTopThree ? rankColors[index] : AppColors.primaryBlack,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: isTopThree
                  ? Icon(Iconsax.medal_star, color: Colors.white, size: 20.sp)
                  : Text(
                      '${entry.rank}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          SizedBox(width: 16.w),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.userName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlack,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${entry.problemsSolved} problems solved',
                  style: TextStyle(fontSize: 12.sp, color: AppColors.textGrey),
                ),
              ],
            ),
          ),
          // Score
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${entry.totalScore}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: isTopThree
                      ? rankColors[index]
                      : AppColors.primaryBlack,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.points,
                style: TextStyle(fontSize: 10.sp, color: AppColors.textGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
