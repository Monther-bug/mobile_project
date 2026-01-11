import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:final_mobile_project/core/routes/app_router.dart';
import 'package:final_mobile_project/core/utils/form_validators.dart';
import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';


class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();

  
  String? validate() {
    return FormValidators.validateLoginFields(
      email: email,
      password: password,
    );
  }

  
  Future<void> login({
    required BuildContext context,
    required AuthProvider authProvider,
    required void Function(String message) onError,
  }) async {
    final validationError = validate();
    if (validationError != null) {
      onError(validationError);
      return;
    }

    await authProvider.login(email, password);

    if (authProvider.errorMessage != null) {
      onError(authProvider.errorMessage!);
    } else if (authProvider.isAuthenticated) {
      if (context.mounted) {
        context.go(AppRoutes.home);
      }
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
