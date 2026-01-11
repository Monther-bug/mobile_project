import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:final_mobile_project/core/routes/app_router.dart';
import 'package:final_mobile_project/core/utils/form_validators.dart';
import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';

class RegisterController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String get name => nameController.text.trim();
  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();
  String get confirmPassword => confirmPasswordController.text.trim();

  String? validate() {
    return FormValidators.validateRegisterFields(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  Future<void> register({
    required BuildContext context,
    required AuthProvider authProvider,
    required void Function(String message) onError,
  }) async {
    final validationError = validate();
    if (validationError != null) {
      onError(validationError);
      return;
    }

    await authProvider.register(name, email, password);

    if (authProvider.errorMessage != null) {
      onError(authProvider.errorMessage!);
    } else if (authProvider.isAuthenticated) {
      if (context.mounted) {
        context.go(AppRoutes.home);
      }
    }
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
