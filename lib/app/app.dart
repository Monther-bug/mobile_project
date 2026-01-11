import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/core/l10n/app_localizations.dart';
import 'package:final_mobile_project/core/l10n/locale_provider.dart';
import 'package:final_mobile_project/core/theme/theme_provider.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:final_mobile_project/core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocaleProvider, ThemeProvider>(
      builder: (context, localeProvider, themeProvider, child) {
        final locale = localeProvider.locale;

        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            final lightTheme = ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF000000),
                brightness: Brightness.light,
              ),
              scaffoldBackgroundColor: AppColors.scaffoldBackground,
              useMaterial3: true,
              textTheme: locale.languageCode == 'ar'
                  ? GoogleFonts.tajawalTextTheme(ThemeData.light().textTheme)
                  : GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
            );

            final darkTheme = ThemeData(
              brightness: Brightness.dark,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF000000),
                brightness: Brightness.dark,
              ),
              scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
              useMaterial3: true,
              textTheme: locale.languageCode == 'ar'
                  ? GoogleFonts.tajawalTextTheme(ThemeData.dark().textTheme)
                  : GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
            );

            return MaterialApp.router(
              title: 'Coding Practice',
              debugShowCheckedModeBanner: false,
              
              routerConfig: appRouter,

              locale: locale,
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],

              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeProvider.themeMode,
            );
          },
        );
      },
    );
  }
}
