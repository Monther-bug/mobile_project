import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/core/theme/app_colors.dart';
import 'package:final_mobile_project/core/theme/app_dimens.dart';
import 'package:final_mobile_project/core/theme/app_text_styles.dart';
import 'package:final_mobile_project/features/auth/providers/auth_provider.dart';
import 'package:final_mobile_project/shared/widgets/custom_text_field.dart';
import 'package:final_mobile_project/shared/widgets/glass_container.dart';
import 'package:final_mobile_project/shared/widgets/gradient_background.dart';
import 'package:final_mobile_project/shared/widgets/primary_button.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _handleRegister() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    await context.read<AuthProvider>().register(name, email, password);

    if (!mounted) return;

    final provider = context.read<AuthProvider>();
    if (provider.errorMessage != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(provider.errorMessage!)));
    } else if (provider.isAuthenticated) {
      Navigator.of(context).pop(); // Go back to login or home
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration Successful! Logging in...')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left, color: AppColors.textBlack),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppDimens.pagePadding),
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Create Account', style: AppTextStyles.heading1),
                    SizedBox(height: AppDimens.spacing8),
                    Text(
                      'Start your journey with us',
                      style: AppTextStyles.subtitle,
                    ),
                    SizedBox(height: AppDimens.spacing40),
                    GlassContainer(
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: 'Full Name',
                            prefixIcon: Iconsax.user,
                            controller: _nameController,
                          ),
                          SizedBox(height: AppDimens.spacing16),
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
                          SizedBox(height: AppDimens.spacing16),
                          CustomTextField(
                            hintText: 'Confirm Password',
                            prefixIcon: Iconsax.tick_circle,
                            obscureText: true,
                            controller: _confirmPasswordController,
                          ),
                          SizedBox(height: AppDimens.spacing24),
                          authProvider.isLoading
                              ? const CircularProgressIndicator()
                              : PrimaryButton(
                                  text: 'REGISTER',
                                  onPressed: _handleRegister,
                                ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppDimens.spacing24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: AppColors.textGrey),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Login', style: AppTextStyles.linkText),
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
