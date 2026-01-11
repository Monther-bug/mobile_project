import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/core/l10n/app_localizations.dart';
import 'package:final_mobile_project/core/theme/app_dimens.dart';
import 'package:final_mobile_project/features/auth/presentation/widgets/auth_footer_link.dart';
import 'package:final_mobile_project/features/auth/presentation/widgets/auth_header.dart';
import 'package:final_mobile_project/features/auth/presentation/widgets/register_form.dart';
import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';
import 'package:final_mobile_project/shared/widgets/gradient_background.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onRegister;

  const RegisterView({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onRegister,
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
                      title: l10n.createAccount,
                      subtitle: l10n.startYourJourney,
                    ),
                    SizedBox(height: AppDimens.spacing40),
                    RegisterForm(
                      nameController: nameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      isLoading: authProvider.isLoading,
                      onRegister: onRegister,
                    ),
                    SizedBox(height: AppDimens.spacing24),
                    AuthFooterLink(
                      message: l10n.alreadyHaveAccount,
                      actionText: l10n.login,
                      onAction: () => context.pop(),
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
