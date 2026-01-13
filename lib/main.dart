import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/app/app.dart';
import 'package:final_mobile_project/core/l10n/locale_provider.dart';
import 'package:final_mobile_project/core/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_mobile_project/core/services/firebase_messaging_service.dart';
import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';
import 'package:final_mobile_project/features/discover/providers/discover_provider.dart';
import 'package:final_mobile_project/features/home/providers/exercise_provider.dart';
import 'package:final_mobile_project/features/home/providers/category_provider.dart';
import 'package:final_mobile_project/features/home/providers/daily_challenge_provider.dart';
import 'package:final_mobile_project/features/onboarding/providers/onboarding_provider.dart';
import 'package:final_mobile_project/features/problems/providers/problem_provider.dart';
import 'package:final_mobile_project/features/problems/providers/solution_provider.dart';
import 'package:final_mobile_project/features/profile/providers/profile_provider.dart';
import 'package:final_mobile_project/features/splash/providers/splash_provider.dart';
import 'package:final_mobile_project/features/notifications/presentation/providers/notification_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessagingService().initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ExerciseProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => DailyChallengeProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => ProblemProvider()),
        ChangeNotifierProvider(create: (_) => SolutionProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => DiscoverProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(
          create: (context) =>
              SplashProvider(Provider.of<AuthProvider>(context, listen: false)),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
