import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../views/home_view.dart';
import '../../controllers/home_controller.dart';
import '../../providers/exercise_provider.dart';
import '../../providers/daily_challenge_provider.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../profile/providers/profile_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController(context);
    _controller.initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getScaffoldBackground(context),
      body: SafeArea(
        child:
            Consumer4<
              ExerciseProvider,
              AuthProvider,
              DailyChallengeProvider,
              ProfileProvider
            >(
              builder:
                  (
                    context,
                    exerciseProvider,
                    authProvider,
                    dailyChallengeProvider,
                    profileProvider,
                    child,
                  ) {
                    return HomeView(
                      isLoading: _controller.isLoading(exerciseProvider),
                      errorMessage: _controller.getErrorMessage(
                        exerciseProvider,
                      ),
                      userName: _controller.getUserName(),
                      stats: profileProvider.userStats,
                      dailyChallenge: dailyChallengeProvider.dailyChallenge,
                      isDailyChallengeLoading: dailyChallengeProvider.isLoading,
                      onRetry: _controller.handleRetry,
                      onRefresh: _controller.handleRefresh,
                      onDailyChallengeTap: _controller.handleDailyChallengeTap,
                    );
                  },
            ),
      ),
    );
  }
}
