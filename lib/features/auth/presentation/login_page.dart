import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:final_mobile_project/core/theme/app_dimens.dart';
import 'package:final_mobile_project/core/theme/app_text_styles.dart';
import 'package:final_mobile_project/features/auth/presentation/register_page.dart';
import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';
import 'package:final_mobile_project/shared/widgets/custom_text_field.dart';
import 'package:final_mobile_project/shared/widgets/glass_container.dart';
import 'package:final_mobile_project/shared/widgets/gradient_background.dart';
import 'package:final_mobile_project/shared/widgets/primary_button.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    await context.read<AuthProvider>().login(email, password);

    if (!mounted) return;

    final provider = context.read<AuthProvider>();
    if (provider.errorMessage != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(provider.errorMessage!)));
    } else if (provider.isAuthenticated) {
      // Navigate to Home Page (to be implemented)
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login Successful!')));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    Icon(
                      Iconsax.code,
                      size: AppDimens.iconLarge,
                      color: AppColors.textBlack,
                    ),
                    SizedBox(height: AppDimens.spacing16),
                    Text('Welcome Back!', style: AppTextStyles.heading1),
                    SizedBox(height: AppDimens.spacing8),
                    Text(
                      'Login to continue your coding journey',
                      style: AppTextStyles.subtitle,
                    ),
                    SizedBox(height: AppDimens.spacing48),
                    GlassContainer(
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: 'Email',
                            prefixIcon: Iconsax.sms,
                            controller: _emailController,
                          ),
                          SizedBox(height: AppDimens.spacing16),
                          CustomTextField(
                            hintText: 'Password',
                            prefixIcon: Iconsax.lock,
                            obscureText: true,
                            controller: _passwordController,
                          ),
                          SizedBox(height: AppDimens.spacing12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: AppColors.textGrey),
                              ),
                            ),
                          ),
                          SizedBox(height: AppDimens.spacing24),
                          authProvider.isLoading
                              ? const CircularProgressIndicator()
                              : PrimaryButton(
                                  text: 'LOGIN',
                                  onPressed: _handleLogin,
                                ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppDimens.spacing24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: AppColors.textGrey),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: AppTextStyles.linkText,
                          ),
                        ),
                      ],
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
