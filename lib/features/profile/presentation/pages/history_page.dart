import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/shimmer_widgets.dart';
import '../../../problems/providers/solution_provider.dart';
import '../../../problems/data/models/solution_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    _initializeData(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.getScaffoldBackground(context),
      appBar: _buildAppBar(context, l10n),
      body: Consumer<SolutionProvider>(
        builder: (context, provider, child) {
          if (provider.isLoadingHistory) return const HistoryListShimmer();
          if (provider.errorMessage != null && provider.submissionHistory.isEmpty) {
            return _buildErrorState(context, l10n, provider);
          }
          if (provider.submissionHistory.isEmpty) return _buildEmptyState(context, l10n);
          return _buildHistoryList(context, provider);
        },
      ),
    );
  }

  void _initializeData(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SolutionProvider>().fetchSubmissionHistory();
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, AppLocalizations l10n) {
    return AppBar(
      backgroundColor: AppColors.getScaffoldBackground(context),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(l10n.submissionHistory, style: TextStyle(color: AppColors.getPrimaryBlack(context), fontSize: 20.sp, fontWeight: FontWeight.bold)),
      centerTitle: true,
    );
  }

  Widget _buildErrorState(BuildContext context, AppLocalizations l10n, SolutionProvider provider) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.warning_2, size: 64.sp, color: AppColors.getTextGrey(context)),
          SizedBox(height: 16.h),
          Text(l10n.failedToLoad, style: TextStyle(fontSize: 16.sp, color: AppColors.getTextGrey(context))),
          SizedBox(height: 8.h),
          ElevatedButton(onPressed: () => provider.fetchSubmissionHistory(), child: Text(l10n.retry)),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.document, size: 64.sp, color: AppColors.getTextGrey(context)),
          SizedBox(height: 16.h),
          Text(l10n.noHistoryYet, style: TextStyle(fontSize: 16.sp, color: AppColors.getTextGrey(context))),
          SizedBox(height: 8.h),
          Text(l10n.startSolving, style: TextStyle(fontSize: 14.sp, color: AppColors.getTextGrey(context))),
        ],
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context, SolutionProvider provider) {
    return RefreshIndicator(
      onRefresh: () => provider.fetchSubmissionHistory(),
      child: ListView.builder(
        padding: EdgeInsets.all(24.w),
        itemCount: provider.submissionHistory.length,
        itemBuilder: (context, index) => HistoryItem(solution: provider.submissionHistory[index]),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final Solution solution;
  const HistoryItem({super.key, required this.solution});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final (statusColor, statusIcon, statusText) = _getStatusInfo(l10n);
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.getInputFill(context),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: statusColor.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, statusColor, statusIcon, statusText),
          SizedBox(height: 12.h),
          _buildDetails(context),
          if (solution.output != null && solution.output!.isNotEmpty) _buildOutput(context),
        ],
      ),
    );
  }

  (Color, IconData, String) _getStatusInfo(AppLocalizations l10n) {
    switch (solution.status) {
      case 'passed':
        return (Colors.green, Iconsax.tick_circle, l10n.passed);
      case 'failed':
        return (Colors.red, Iconsax.close_circle, l10n.failed);
      default:
        return (Colors.orange, Iconsax.timer_1, l10n.pending);
    }
  }

  Widget _buildHeader(BuildContext context, Color color, IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text('Problem #${solution.problemId}', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.getPrimaryBlack(context)))),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 14.sp),
              SizedBox(width: 4.w),
              Text(text, style: TextStyle(color: color, fontSize: 12.sp, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Row(
      children: [
        Icon(Iconsax.calendar, size: 14.sp, color: AppColors.getTextGrey(context)),
        SizedBox(width: 6.w),
        Text(_formatDate(solution.createdAt), style: TextStyle(fontSize: 12.sp, color: AppColors.getTextGrey(context))),
        if (solution.timeTaken != null) ...[
          SizedBox(width: 16.w),
          Icon(Iconsax.timer_1, size: 14.sp, color: AppColors.getTextGrey(context)),
          SizedBox(width: 6.w),
          Text('${solution.timeTaken}s', style: TextStyle(fontSize: 12.sp, color: AppColors.getTextGrey(context))),
        ],
      ],
    );
  }

  Widget _buildOutput(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(color: AppColors.getGlassBackground(context), borderRadius: BorderRadius.circular(8.r)),
          child: Text(solution.output!, style: TextStyle(fontFamily: 'monospace', fontSize: 11.sp, color: AppColors.getTextBlack(context)), maxLines: 3, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) => '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
}
