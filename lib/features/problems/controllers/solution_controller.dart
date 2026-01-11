import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../providers/problem_provider.dart';
import '../providers/solution_provider.dart';

class SolutionController {
  final BuildContext context;
  final TextEditingController codeController;

  SolutionController({required this.context, required this.codeController});

  ProblemProvider get _problemProvider => context.read<ProblemProvider>();
  SolutionProvider get _solutionProvider => context.read<SolutionProvider>();

  void submitSolution() {
    final l10n = AppLocalizations.of(context)!;
    if (_problemProvider.currentProblem == null) {
      _showSnackBar(l10n.noProblemSelected);
      return;
    }
    if (codeController.text.trim().isEmpty) {
      _showSnackBar(l10n.pleaseEnterCode);
      return;
    }
    _solutionProvider.submitSolution(
      problemId: _problemProvider.currentProblem!.id,
      code: codeController.text,
    );
  }

  void clearCode() => codeController.clear();

  String getCode() => codeController.text;

  void setCode(String code) => codeController.text = code;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void dispose() => codeController.dispose();
}
