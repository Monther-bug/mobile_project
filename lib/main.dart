import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/features/splash/presentation/splash_page.dart';
import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Final Mobile Project',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF000000),
            ),
            useMaterial3: true,
            fontFamily: 'Roboto',
          ),
          home: const SplashPage(),
        );
      },
    );
  }
}
