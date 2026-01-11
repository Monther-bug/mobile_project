import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../controllers/solution_controller.dart';
import '../../providers/solution_provider.dart';
import 'solution_result.dart';

class ProblemSolutionTab extends StatefulWidget {
  const ProblemSolutionTab({super.key});

  @override
  State<ProblemSolutionTab> createState() => _ProblemSolutionTabState();
}

class _ProblemSolutionTabState extends State<ProblemSolutionTab> {
  final TextEditingController _codeController = TextEditingController();
  late SolutionController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SolutionController(
      context: context,
      codeController: _codeController,
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
    return Consumer<SolutionProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(l10n),
              SizedBox(height: 12.h),
              _buildCodeEditor(),
              SizedBox(height: 16.h),
              _buildSubmitButton(l10n, provider),
              SizedBox(height: 24.h),
              if (provider.errorMessage != null)
                SolutionErrorMessage(message: provider.errorMessage!),
              if (provider.currentSolution != null)
                SolutionResultMessage(solution: provider.currentSolution!),
              SizedBox(height: 80.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Row(
      children: [
        Text(
          l10n.yourSolution,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlack,
          ),
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: const Color(0xFF3776AB),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.code, size: 16.sp, color: Colors.white),
              SizedBox(width: 4.w),
              Text(
                l10n.python,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCodeEditor() {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.textLightGrey.withOpacity(0.2)),
      ),
      child: TextField(
        controller: _codeController,
        maxLines: null,
        expands: true,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: 14.sp,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'data = input()\nresult = data\nprint(result)',
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontFamily: 'monospace',
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.w),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(AppLocalizations l10n, SolutionProvider provider) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: provider.isSubmitting ? null : _controller.submitSolution,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlack,
          foregroundColor: AppColors.primaryWhite,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: provider.isSubmitting
            ? SizedBox(
                height: 20.h,
                width: 20.w,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                l10n.submitSolution,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
