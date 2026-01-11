import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';
import 'package:final_mobile_project/features/home/data/models/exercise_model.dart';
import 'package:final_mobile_project/features/home/providers/daily_challenge_provider.dart';
import 'package:final_mobile_project/features/home/providers/exercise_provider.dart';
import 'package:final_mobile_project/features/problems/providers/problem_provider.dart';
import 'package:final_mobile_project/features/profile/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_router.dart';



class HomeController {
  final BuildContext context;

  HomeController(this.context);

  void initializeData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchExercises();
      _fetchDailyChallenge();
      _fetchUserStatsIfAuthenticated();
    });
  }

  void _fetchExercises() {
    context.read<ExerciseProvider>().fetchExercises(refresh: true);
  }

  void _fetchDailyChallenge() {
    context.read<DailyChallengeProvider>().fetchDailyChallenge();
  }

  void _fetchUserStatsIfAuthenticated() {
    if (context.read<AuthProvider>().isAuthenticated) {
      context.read<ProfileProvider>().fetchUserStats();
    }
  }


  Future<void> handleRefresh() async {
    final authProvider = context.read<AuthProvider>();

    await Future.wait([
      context.read<ExerciseProvider>().fetchExercises(refresh: true),
      context.read<DailyChallengeProvider>().fetchDailyChallenge(),
      if (authProvider.isAuthenticated)
        context.read<ProfileProvider>().fetchUserStats(),
    ]);
  }

  void handleRetry() {
    context.read<ExerciseProvider>().fetchExercises(refresh: true);
  }

  Future<void> handleDailyChallengeTap(Problem problem) async {
    final problemProvider = context.read<ProblemProvider>();
    await problemProvider.fetchProblemById(problem.id);

    final fetchedProblem = problemProvider.currentProblem;
    if (fetchedProblem != null) {
      context.push(AppRoutes.problemDetail, extra: fetchedProblem);
    }
  }

  String getUserName() {
    return context.read<AuthProvider>().user?.name ?? 'User';
  }

  bool isLoading(ExerciseProvider exerciseProvider) {
    return exerciseProvider.isLoading && exerciseProvider.exercises.isEmpty;
  }

  
  bool hasError(ExerciseProvider exerciseProvider) {
    return exerciseProvider.errorMessage != null &&
        exerciseProvider.exercises.isEmpty;
  }

  String? getErrorMessage(ExerciseProvider exerciseProvider) {
    return hasError(exerciseProvider) ? exerciseProvider.errorMessage : null;
  }
}
