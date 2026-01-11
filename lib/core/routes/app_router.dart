import 'package:go_router/go_router.dart';
import 'package:final_mobile_project/features/splash/presentation/splash_page.dart';
import 'package:final_mobile_project/features/auth/presentation/login_page.dart';
import 'package:final_mobile_project/features/auth/presentation/register_page.dart';
import 'package:final_mobile_project/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:final_mobile_project/features/home/presentation/pages/main_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
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
  ],
);
