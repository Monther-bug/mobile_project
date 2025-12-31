import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../providers/solution_provider.dart';
import '../../providers/problem_provider.dart';

class ProblemSolutionTab extends StatefulWidget {
  const ProblemSolutionTab({super.key});

  @override
  State<ProblemSolutionTab> createState() => _ProblemSolutionTabState();
}

class _ProblemSolutionTabState extends State<ProblemSolutionTab> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _submitSolution() {
    final problemProvider = context.read<ProblemProvider>();
    final solutionProvider = context.read<SolutionProvider>();

    if (problemProvider.currentProblem == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No problem selected')));
      return;
    }

    if (_codeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your code')));
      return;
    }

    solutionProvider.submitSolution(
      problemId: problemProvider.currentProblem!.id,
      code: _codeController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SolutionProvider>(
      builder: (context, solutionProvider, child) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Solution',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlack,
                ),
              ),
              SizedBox(height: 12.h),

              // Code Editor
              Container(
                height: 300.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: AppColors.textLightGrey.withOpacity(0.2),
                  ),
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
                    hintText:
                        '// Write your code here...\n\nfunction solution() {\n  // Your code\n}',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontFamily: 'monospace',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16.w),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: solutionProvider.isSubmitting
                      ? null
                      : _submitSolution,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlack,
                    foregroundColor: AppColors.primaryWhite,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: solutionProvider.isSubmitting
                      ? SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'Submit Solution',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              SizedBox(height: 24.h),

              // Error Message
              if (solutionProvider.errorMessage != null)
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red.shade700),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          solutionProvider.errorMessage!,
                          style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Success Message & Results
              if (solutionProvider.currentSolution != null) ...[
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: solutionProvider.currentSolution!.isPassed
                        ? Colors.green.shade50
                        : Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: solutionProvider.currentSolution!.isPassed
                          ? Colors.green.shade200
                          : Colors.orange.shade200,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            solutionProvider.currentSolution!.isPassed
                                ? Icons.check_circle_outline
                                : Icons.info_outline,
                            color: solutionProvider.currentSolution!.isPassed
                                ? Colors.green.shade700
                                : Colors.orange.shade700,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              solutionProvider.currentSolution!.isPassed
                                  ? 'Solution Passed!'
                                  : 'Solution Status: ${solutionProvider.currentSolution!.status}',
                              style: TextStyle(
                                color:
                                    solutionProvider.currentSolution!.isPassed
                                    ? Colors.green.shade700
                                    : Colors.orange.shade700,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (solutionProvider.currentSolution!.output != null) ...[
                        SizedBox(height: 12.h),
                        Text(
                          'Output:',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textBlack,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            solutionProvider.currentSolution!.output!,
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 12.sp,
                              color: AppColors.textBlack,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],

              SizedBox(height: 80.h),
            ],
          ),
        );
      },
    );
  }
}
