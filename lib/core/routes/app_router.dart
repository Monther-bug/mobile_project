import 'package:go_router/go_router.dart';
import 'package:final_mobile_project/features/splash/presentation/splash_page.dart';
import 'package:final_mobile_project/features/auth/presentation/login_page.dart';
import 'package:final_mobile_project/features/auth/presentation/register_page.dart';
import 'package:final_mobile_project/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:final_mobile_project/features/home/presentation/pages/main_page.dart';
import 'package:final_mobile_project/features/problems/presentation/pages/problem_detail_page.dart';
import 'package:final_mobile_project/features/profile/presentation/pages/leaderboard_page.dart';
import 'package:final_mobile_project/features/profile/presentation/pages/history_page.dart';
import 'package:final_mobile_project/features/profile/presentation/pages/about_page.dart';
import 'package:final_mobile_project/features/home/data/models/exercise_model.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String problemDetail = '/problem';
  static const String leaderboard = '/leaderboard';
  static const String history = '/history';
  static const String about = '/about';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: AppRoutes.problemDetail,
      builder: (context, state) {
        final problem = state.extra as Problem;
        return ProblemDetailPage(problem: problem);
      },
    ),
    GoRoute(
      path: AppRoutes.leaderboard,
      builder: (context, state) => const LeaderboardPage(),
    ),
    GoRoute(
      path: AppRoutes.history,
      builder: (context, state) => const HistoryPage(),
    ),
    GoRoute(
      path: AppRoutes.about,
      builder: (context, state) => const AboutPage(),
    ),
  ],
);
