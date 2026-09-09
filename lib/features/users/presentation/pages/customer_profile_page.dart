import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/router/address_routes.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/router/user_routes.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/widgets/profile_option_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/widgets/profile_header.dart';

class CustomerProfilePage extends StatelessWidget {
  const CustomerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profile =
        (context.read<AuthCubit>().state as AuthAuthenticated).profile;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Mi Perfil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(profile: profile),
            const SizedBox(height: 8),
            const ProfileSectionTitle(title: 'Mi cuenta'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ProfileOptionTile(
                    icon: Icons.person_outline,
                    title: 'Editar perfil',
                    subtitle: 'Nombre, teléfono, alias',
                    onTap: () => context.pushNamed(UserRoutes.editProfileName),
                  ),
                  const Divider(height: 1, indent: 56),

                  ProfileOptionTile(
                    icon: Icons.location_on_outlined,
                    title: 'Mis direcciones',
                    subtitle: 'Agrega o edita tus direcciones',
                    onTap: () => context.pushNamed(AddressRoutes.myAddressesName),
                  ),
                ],
              ),
            ),

            const ProfileSectionTitle(title: 'Sesión'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ProfileOptionTile(
                icon: Icons.logout,
                title: 'Cerrar sesión',
                isDestructive: true,
                onTap: () => _confirmLogout(context),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<AuthCubit>().logout();
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }
}
