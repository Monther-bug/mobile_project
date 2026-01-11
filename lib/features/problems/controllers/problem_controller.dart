import 'package:final_mobile_project/features/home/data/models/exercise_model.dart'
    show Problem;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/problem_provider.dart';
import '../providers/solution_provider.dart';

class ProblemController {
  final BuildContext context;
  final Problem problem;
  final TabController tabController;

  ProblemController({
    required this.context,
    required this.problem,
    required this.tabController,
  });

  ProblemProvider get _problemProvider => context.read<ProblemProvider>();
  SolutionProvider get _solutionProvider => context.read<SolutionProvider>();

  void initialize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _problemProvider.setProblem(problem);
      _solutionProvider.clearCurrentSolution();
    });
  }

  void switchToSolutionTab() => tabController.animateTo(1);

  void switchToDescriptionTab() => tabController.animateTo(0);

  void goBack() => context.pop();

  void retryFetch() => _problemProvider.fetchProblemById(problem.id);

  void fetchHint() => _problemProvider.fetchHint(problem.id);

  Future<void> submitSolution(String code) async {
    if (_problemProvider.currentProblem == null) return;
    if (code.trim().isEmpty) return;
    await _solutionProvider.submitSolution(
      problemId: _problemProvider.currentProblem!.id,
      code: code,
    );
  }

  bool isLoading(ProblemProvider provider) => provider.isLoading;

  bool hasError(ProblemProvider provider) => provider.errorMessage != null;

  Problem getDisplayProblem(ProblemProvider provider) =>
      provider.currentProblem ?? problem;

  void dispose() => tabController.dispose();
}
