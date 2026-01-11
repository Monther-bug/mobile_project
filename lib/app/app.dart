import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_mobile_project/core/l10n/app_localizations.dart';
import 'package:final_mobile_project/features/splash/presentation/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const locale = Locale('ar');

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final baseTheme = ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF000000),
          ),
          useMaterial3: true,
        );

        return MaterialApp(
          title: 'Coding Practice',
          debugShowCheckedModeBanner: false,

          // Localization settings
          locale: locale, // Set Arabic as default
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          theme: baseTheme.copyWith(
            textTheme: locale.languageCode == 'ar'
                ? GoogleFonts.tajawalTextTheme(baseTheme.textTheme)
                : GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
          ),
          home: const SplashPage(),
        );
      },
    );
  }
}
