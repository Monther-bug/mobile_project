import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/core/l10n/app_localizations.dart';
import 'package:final_mobile_project/core/theme/app_dimens.dart';
import 'package:final_mobile_project/features/auth/presentation/widgets/auth_footer_link.dart';
import 'package:final_mobile_project/features/auth/presentation/widgets/auth_header.dart';
import 'package:final_mobile_project/features/auth/presentation/widgets/login_form.dart';
import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';
import 'package:final_mobile_project/shared/widgets/gradient_background.dart';
import 'package:go_router/go_router.dart';
import 'package:final_mobile_project/core/routes/app_router.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;

  const LoginView({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppDimens.pagePadding),
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthHeader(
                      title: l10n.welcomeBack,
                      subtitle: l10n.loginToContinue,
                      showLogo: true,
                    ),
                    SizedBox(height: AppDimens.spacing48),
                    LoginForm(
                      emailController: emailController,
                      passwordController: passwordController,
                      isLoading: authProvider.isLoading,
                      onLogin: onLogin,
                    ),
                    SizedBox(height: AppDimens.spacing24),
                    AuthFooterLink(
                      message: l10n.dontHaveAccount,
                      actionText: l10n.register,
                      onAction: () => context.push(AppRoutes.register),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
