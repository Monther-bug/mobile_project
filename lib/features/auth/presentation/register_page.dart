import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/features/auth/controllers/register_controller.dart';
import 'package:final_mobile_project/features/auth/presentation/views/register_view.dart';
import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _controller = RegisterController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _handleRegister() async {
    final authProvider = context.read<AuthProvider>();
    await _controller.register(
      context: context,
      authProvider: authProvider,
      onError: _showSnackBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RegisterView(
      nameController: _controller.nameController,
      emailController: _controller.emailController,
      passwordController: _controller.passwordController,
      confirmPasswordController: _controller.confirmPasswordController,
      onRegister: _handleRegister,
    );
  }
}
