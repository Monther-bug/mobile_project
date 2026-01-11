import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/features/auth/controllers/login_controller.dart';
import 'package:final_mobile_project/features/auth/presentation/views/login_view.dart';
import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = LoginController();

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

  Future<void> _handleLogin() async {
    final authProvider = context.read<AuthProvider>();
    await _controller.login(
      context: context,
      authProvider: authProvider,
      onError: _showSnackBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(
      emailController: _controller.emailController,
      passwordController: _controller.passwordController,
      onLogin: _handleLogin,
    );
  }
}
