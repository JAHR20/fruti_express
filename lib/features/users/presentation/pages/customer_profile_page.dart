import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/config/menu/customer_profile_menu_items.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/widgets/profile_option_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/widgets/profile_header.dart';

class CustomerProfilePage extends StatelessWidget {
  const CustomerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = (context.read<AuthCubit>().state as AuthAuthenticated).user;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        title: Text(
          'Mi Perfil',
          style: TextStyle(
            color: colorScheme.onPrimary, 
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: colorScheme.primary,
        automaticallyImplyLeading: false,
      ),
      // 1. Garantizamos que toda la pantalla sea scrolleable para evitar overflows
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100, top: 0), // Espacio inferior para el scroll
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(user: profile),
            const SizedBox(height: 8),

            // 2. SECCIÓN: MI CUENTA (Generada dinámicamente con los ítems)
            const ProfileSectionTitle(title: 'Mi cuenta'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: customerAccountItems.map((item) {
                  final bool isLast = item == customerAccountItems.last;
                  return Column(
                    children: [
                      ProfileOptionTile(
                        icon: item.icon,
                        title: item.title,
                        subtitle: item.subtitle,
                        onTap: () => context.pushNamed(item.routeName),
                      ),
                      if (!isLast) const Divider(height: 1, indent: 56),
                    ],
                  );
                }).toList(),
              ),
            ),

            // 3. SECCIÓN: SESIÓN (¡Aquí está de regreso el botón de cerrar sesión con su tarjeta y diálogo!)
            const ProfileSectionTitle(title: 'Sesión'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ProfileOptionTile(
                icon: Icons.logout,
                title: 'Cerrar sesión',
                subtitle: 'Salir de tu cuenta actual',
                isDestructive: true,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmDialog(
                        title: 'Cerrar Sesión',
                        message:
                            '¿Estás seguro de que deseas cerrar tu sesión en Fruti Express?',
                        confirmText: 'Salir',
                        cancelText: 'Cancelar',
                        confirmColor: colorScheme.error,
                        onConfirm: () {
                          context.read<AuthCubit>().logout();
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}