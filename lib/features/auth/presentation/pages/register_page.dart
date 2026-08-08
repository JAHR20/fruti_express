import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // 📦 IMPORTANTE: Agrega flutter_bloc
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/utils/validators.dart';


import '../widgets/custom_auth_field.dart';
import '../widgets/primary_auth_button.dart';
import '../widgets/terms_checkbox.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  
  final _nombreCtrl = TextEditingController();
  final _apPaternoCtrl = TextEditingController();
  final _apMaternoCtrl = TextEditingController();
  final _telefonoCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();
  
  bool _aceptaTerminos = false;

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _apPaternoCtrl.dispose();
    _apMaternoCtrl.dispose();
    _telefonoCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPassCtrl.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_aceptaTerminos) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Debes aceptar los términos y condiciones')),
        );
        return;
      }

      context.read<AuthCubit>().register(
        nombre: _nombreCtrl.text.trim(),
        apellidoPaterno: _apPaternoCtrl.text.trim(),
        apellidoMaterno: _apMaternoCtrl.text.trim().isEmpty ? null : _apMaternoCtrl.text.trim(), 
        telefono: _telefonoCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      // 🛡️ ENVOLVEMOS EL BODY EN UN BLOCCONSUMER
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

          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Center(child: Icon(Icons.hexagon_outlined, size: 40, color: Colors.white)),
                ),
                
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Color(0xFFF8FAFC)),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('REGISTRATION', style: TextStyle(color: Color(0xFF1E3A8A), fontWeight: FontWeight.bold, fontSize: 12)),
                            const SizedBox(height: 8),
                            const Text('Create an account', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 32),
                            
                            CustomAuthField(
                              label: 'Nombre(s)',
                              hintText: 'Ej. Juan',
                              controller: _nombreCtrl,
                              validator: Validators.name,
                              enabled: !isLoading, // Bloquear input si está cargando
                            ),
                            const SizedBox(height: 16),
                            
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CustomAuthField(
                                    label: 'Ap. Paterno',
                                    hintText: 'García',
                                    controller: _apPaternoCtrl,
                                    validator: Validators.apellido,
                                    enabled: !isLoading,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: CustomAuthField(
                                    label: 'Ap. Materno (Opcional)',
                                    hintText: 'López',
                                    controller: _apMaternoCtrl,
                                    enabled: !isLoading,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            CustomAuthField(
                              label: 'Teléfono',
                              hintText: '10 dígitos',
                              controller: _telefonoCtrl,
                              validator: Validators.phone,
                              enabled: !isLoading,
                            ),
                            const SizedBox(height: 16),

                            CustomAuthField(
                              label: 'Email',
                              hintText: 'correo@ejemplo.com',
                              controller: _emailCtrl,
                              validator: Validators.email,
                              enabled: !isLoading,
                            ),
                            const SizedBox(height: 16),

                            CustomAuthField(
                              label: 'Password',
                              hintText: '********',
                              isPassword: true,
                              controller: _passwordCtrl,
                              validator: Validators.registerPassword,
                              enabled: !isLoading,
                            ),
                            const SizedBox(height: 16),
                            
                            CustomAuthField(
                              label: 'Confirmar Password',
                              hintText: '********',
                              isPassword: true,
                              controller: _confirmPassCtrl,
                              validator: (value) => Validators.confirmPassword(_passwordCtrl.text, value),
                              enabled: !isLoading,
                            ),
                            const SizedBox(height: 24),
                            
                            TermsCheckbox(
                              onChanged: (isChecked) {
                                setState(() => _aceptaTerminos = isChecked);
                              },
                            ),
                            const SizedBox(height: 32),
                            
                            isLoading 
                              ? const Center(child: CircularProgressIndicator(color: Color(0xFF1E3A8A)))
                              : PrimaryAuthButton(
                                  text: 'Register',
                                  backgroundColor: const Color(0xFF1E3A8A),
                                  onPressed: _submitForm,
                                ),
                            
                            const SizedBox(height: 24),
                            const Center(child: Text('Already have an account?', style: TextStyle(color: Colors.black54))),
                            const SizedBox(height: 12),
                            
                            PrimaryAuthButton(
                              text: 'Login',
                              backgroundColor: const Color(0xFF2C2C4E),
                              onPressed: isLoading ? () {} : () => context.go(AppRouter.login), // Deshabilitar si carga
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