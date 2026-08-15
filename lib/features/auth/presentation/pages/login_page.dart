import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // 📦 IMPORTANTE
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';

import '../widgets/custom_auth_field.dart';
import '../widgets/primary_auth_button.dart';
import '../widgets/social_auth_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().login(
        _emailController.text.trim(),
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 80,
                      left: 24,
                      right: 24,
                      bottom: 32,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.hexagon_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Fruty\nExpress',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 40),

                          CustomAuthField(
                            label: 'Email',
                            hintText: 'ejemplo@correo.com',
                            controller: _emailController,
                            validator: Validators.email,
                            enabled: !isLoading,
                          ),
                          const SizedBox(height: 16),
                          CustomAuthField(
                            label: 'Password',
                            hintText: '********',
                            controller: _passwordController,
                            isPassword: true,
                            validator: Validators.loginPassword,
                            enabled: !isLoading,
                          ),

                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Checkbox(
                                      value: false,
                                      onChanged: (value) {},
                                      side: const BorderSide(
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Remember me',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : PrimaryAuthButton(
                                  text: 'Sign in',
                                  backgroundColor: Colors.white,
                                  textColor: const Color(0xFF1E3A8A),
                                  onPressed: _submitForm,
                                ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Color.fromARGB(206, 0, 0, 0)),
                        ),
                        const SizedBox(height: 16),

                        Row(
                          children: [
                            SocialAuthButton(
                              text: 'Facebook',
                              iconPath: 'assets/icons/facebook.png',
                              onPressed: () => {},
                            ),
                            const SizedBox(width: 16),
                            SocialAuthButton(
                              text: 'Google',
                              iconPath: 'assets/icons/google.png',
                              onPressed: () => {},
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        PrimaryAuthButton(
                          text: 'Sign up with email',
                          backgroundColor: const Color(0xFF2C2C4E),
                          textColor: Colors.white,
                          onPressed: isLoading
                              ? () {}
                              : () => context.go('/register'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
