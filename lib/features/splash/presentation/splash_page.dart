import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/core/routes/app_router.dart';
import 'package:final_mobile_project/features/splash/presentation/widgets/splash_view.dart';
import 'package:final_mobile_project/features/splash/providers/splash_provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, provider, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (provider.destination == SplashNavigationDestination.unknown) {
             provider.initSplash();
          } else {
             _navigate(context, provider.destination);
          }
        });
        
        return const SplashView();
      }
    );
  }

  void _navigate(BuildContext context, SplashNavigationDestination destination) {
     String route;
     switch (destination) {
       case SplashNavigationDestination.home:
         route = AppRoutes.home;
         break;
       case SplashNavigationDestination.onboarding:
         route = AppRoutes.onboarding;
         break;
       case SplashNavigationDestination.login:
         route = AppRoutes.login;
         break;
       default:
         return;
     }

     context.go(route);
  }
}
