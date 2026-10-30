import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/constants/app_assets.dart';
import 'package:fruti_express_jahr_admin/core/utils/app_formatters.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/router/auth_routes.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/widgets/login_bottom_clipper.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';

import '../../../../core/widgets/custom_text_field.dart';
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
                      top: 60,
                      left: 24,
                      right: 24,
                      bottom: 32,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.image,
                                size: 60,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '¡Hola! Bienvenido de nuevo',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Inicia sesión para continuar',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: Colors.grey[500]),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            label: 'Correo electrónico',
                            hintText: 'ejemplo@correo.com',
                            controller: _emailController,
                            inputFormatters: [AppFormatters.email],
                            colorLabel: Colors.white,
                            validator: Validators.email,
                            enabled: !isLoading,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            label: 'Contraseña',
                            hintText: '********',
                            controller: _passwordController,
                            isPassword: true,
                            colorLabel: Colors.white,
                            validator: Validators.loginPassword,
                            enabled: !isLoading,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all<EdgeInsets>(
                                    EdgeInsets.zero,
                                  ),
                                  minimumSize: WidgetStateProperty.all<Size>(
                                    const Size(0, 0),
                                  ),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  '¿Olvidaste tu contraseña?',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : PrimaryAuthButton(
                                  text: 'Iniciar sesión',
                                  fontSize: 18,
                                  backgroundColor: Colors.white,
                                  textColor: const Color(0xFF1E3A8A),
                                  onPressed: _submitForm,
                                ),
                        ],
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: LoginBottomClipper(),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(24, 56, 24, 32),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          const Text(
                            "¿No tienes una cuenta?",
                            style: TextStyle(
                              color: Color.fromARGB(206, 0, 0, 0),
                            ),
                          ),

                          const SizedBox(height: 16),

                          Row(
                            children: [
                              Expanded(
                                child: SocialAuthButton(
                                  iconPath: AppAssets.googleLogo,
                                  onPressed: () {
                                    if (!isLoading) {
                                      context.read<AuthCubit>().signInWithGoogle();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          PrimaryAuthButton(
                            text: 'Regístrate con tu correo electrónico',
                            backgroundColor: const Color(0xFF2C2C4E),
                            textColor: Colors.white,
                            onPressed: isLoading
                                ? () {}
                                : () =>
                                      context.goNamed(AuthRoutes.registerName),
                          ),
                        ],
                      ),
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
