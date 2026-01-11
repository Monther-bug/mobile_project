import 'package:flutter/material.dart';
import 'package:final_mobile_project/core/l10n/app_localizations.dart';
import 'package:final_mobile_project/core/theme/app_dimens.dart';
import 'package:final_mobile_project/shared/widgets/custom_text_field.dart';
import 'package:final_mobile_project/shared/widgets/glass_container.dart';
import 'package:final_mobile_project/shared/widgets/primary_button.dart';
import 'package:iconsax/iconsax.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isLoading;
  final VoidCallback onRegister;

  const RegisterForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isLoading,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GlassContainer(
      child: Column(
        children: [
          CustomTextField(
            hintText: l10n.fullName,
            prefixIcon: Iconsax.user,
            controller: nameController,
          ),
          SizedBox(height: AppDimens.spacing16),
          CustomTextField(
            hintText: l10n.email,
            prefixIcon: Iconsax.sms,
            controller: emailController,
          ),
          SizedBox(height: AppDimens.spacing16),
          CustomTextField(
            hintText: l10n.password,
            prefixIcon: Iconsax.lock,
            obscureText: true,
            controller: passwordController,
          ),
          SizedBox(height: AppDimens.spacing16),
          CustomTextField(
            hintText: l10n.confirmPassword,
            prefixIcon: Iconsax.tick_circle,
            obscureText: true,
            controller: confirmPasswordController,
          ),
          SizedBox(height: AppDimens.spacing24),
          isLoading
              ? const CircularProgressIndicator()
              : PrimaryButton(
                  text: l10n.register.toUpperCase(),
                  onPressed: onRegister,
                ),
        ],
      ),
    );
  }
}
