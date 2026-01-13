import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../providers/profile_provider.dart';

class ProfileStats extends StatefulWidget {
  const ProfileStats({super.key});

  @override
  State<ProfileStats> createState() => _ProfileStatsState();
}

class _ProfileStatsState extends State<ProfileStats> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().fetchUserStats();
      context.read<ProfileProvider>().fetchUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        final stats = profileProvider.userStats;
        final _ = profileProvider.userProfile;

        final rank = stats?.rank != null ? '#${stats!.rank}' : '--';
        final problemsSolved = stats?.problemsSolved.toString() ?? '--';
        final totalPoints = stats?.totalPoints.toString() ?? '--';

        if (profileProvider.isLoadingStats) {
          return Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: AppColors.getPrimaryBlack(context),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade800,
              highlightColor: Colors.grey.shade600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildShimmerStatItem(),
                  _buildDivider(context),
                  _buildShimmerStatItem(),
                  _buildDivider(context),
                  _buildShimmerStatItem(),
                ],
              ),
            ),
          );
        }

        return Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColors.getPrimaryBlack(context),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                AppLocalizations.of(context)!.rank,
                rank,
                AppColors.getPrimaryWhite(context),
              ),
              _buildDivider(context),
              _buildStatItem(
                AppLocalizations.of(context)!.solved,
                problemsSolved,
                AppColors.getPrimaryWhite(context),
              ),
              _buildDivider(context),
              _buildStatItem(
                AppLocalizations.of(context)!.points,
                totalPoints,
                AppColors.getPrimaryWhite(context),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: color.withOpacity(0.7)),
        ),
      ],
    );
  }

  Widget _buildShimmerStatItem() {
    return Column(
      children: [
        Container(
          width: 40.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        SizedBox(height: 4.h),
        Container(
          width: 50.w,
          height: 12.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      height: 30.h,
      width: 1.w,
      color: AppColors.getPrimaryWhite(context).withOpacity(0.2),
    );
  }
}
