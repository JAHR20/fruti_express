import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/widgets/primary_auth_button.dart';

class BienvenidaPage extends StatelessWidget {
  const BienvenidaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F0F8), 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Icon(Icons.hexagon_outlined, size: 60, color: Colors.black87),
              const SizedBox(height: 16),
              const Text(
                'Fruty\nExpress',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
              
              const Spacer(),
            
              const Text(
                '¿No tienes una cuenta?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 16),
              
              PrimaryAuthButton(
                text: 'Regístrate con email',
                onPressed: () {
                  context.go(AppRouter.register);
                },
              ),
              
              const SizedBox(height: 24),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¿Ya eres miembro? '),
                  GestureDetector(
                    onTap: () {
                      context.go(AppRouter.login); 
                    },
                    child: const Text(
                      'Inicia Sesión',
                      style: TextStyle(
                        color: Color(0xFF1E40AF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}