import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/app_formatters.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/router/auth_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../widgets/primary_auth_button.dart';
import '../widgets/terms_checkbox.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();

  bool _acceptsTerms = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPassCtrl.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_acceptsTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Debes aceptar los términos y condiciones'),
          ),
        );
        return;
      }
      context.read<AuthCubit>().register(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state case AuthError(:final message)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          }

          if (state case AuthEmailConfirmationPending()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Te enviamos un correo de confirmación. '
                  'Revísalo antes de iniciar sesión.',
                ),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 5),
              ),
            );

            context.goNamed(AuthRoutes.loginName);
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;
          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Center(
                    child: Icon(
                      Icons.hexagon_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Color(0xFFF8FAFC)),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 10.0,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'REGISTRO',
                              style: TextStyle(
                                color: Color(0xFF1E3A8A),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Crear una cuenta',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 32),

                            CustomTextField(
                              label: 'Email',
                              hintText: 'correo@ejemplo.com',
                              controller: _emailCtrl,
                              inputFormatters: [AppFormatters.email],
                              validator: Validators.email,
                              enabled: !isLoading,
                              colorLabel: Colors.blue.shade900,
                            ),
                            const SizedBox(height: 16),

                            CustomTextField(
                              label: 'Contraseña',
                              hintText: '********',
                              isPassword: true,
                              controller: _passwordCtrl,
                              validator: Validators.registerPassword,
                              enabled: !isLoading,
                              colorLabel: Colors.blue.shade900,
                            ),
                            const SizedBox(height: 16),

                            CustomTextField(
                              label: 'Confirmar Contraseña',
                              hintText: '********',
                              isPassword: true,
                              controller: _confirmPassCtrl,
                              colorLabel: Colors.blue.shade900,
                              validator: (value) => Validators.confirmPassword(
                                _passwordCtrl.text,
                                value,
                              ),
                              enabled: !isLoading,
                            ),
                            const SizedBox(height: 24),

                            TermsCheckbox(
                              onChanged: (isChecked) {
                                setState(() => _acceptsTerms = isChecked);
                              },
                            ),
                            const SizedBox(height: 32),

                            isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xFF1E3A8A),
                                    ),
                                  )
                                : PrimaryAuthButton(
                                    text: 'Register',
                                    backgroundColor: const Color(0xFF1E3A8A),
                                    onPressed: _submitForm,
                                  ),

                            const SizedBox(height: 24),
                            const Center(
                              child: Text(
                                '¿Ya tienes una cuenta?',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            const SizedBox(height: 12),

                            PrimaryAuthButton(
                              text: 'Iniciar Sesión',
                              backgroundColor: const Color(0xFF2C2C4E),
                              onPressed: isLoading
                                  ? () {}
                                  : () => context.goNamed(AuthRoutes.loginName),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
