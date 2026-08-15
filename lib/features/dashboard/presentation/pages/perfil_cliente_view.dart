import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/config/router/admin_router.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/perfil_header.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/perfil_opcion_tile.dart';

class PerfilClienteView extends StatelessWidget {
  const PerfilClienteView({super.key});

  @override
  Widget build(BuildContext context) {
    final perfil =
        (context.read<AuthCubit>().state as AuthAuthenticated).perfil;

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
            PerfilHeader(perfil: perfil),
            const SizedBox(height: 8),
            const PerfilSeccionTitulo(titulo: 'Mi cuenta'),
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
                  PerfilOpcionTile(
                    icono: Icons.person_outline,
                    titulo: 'Editar perfil',
                    subtitulo: 'Nombre, teléfono, alias',
                    onTap: () => context.push(AppRouter.clienteEditarPerfil),
                  ),
                  const Divider(height: 1, indent: 56),

                  PerfilOpcionTile(
                    icono: Icons.location_on_outlined,
                    titulo: 'Mis direcciones',
                    subtitulo: 'Agrega o edita tus direcciones',
                    onTap: () => context.push(AppRouter.clienteMisDirecciones),
                  ),
                ],
              ),
            ),

            // ─── Sesión ───────────────────────────────────────────────────
            const PerfilSeccionTitulo(titulo: 'Sesión'),
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
              child: PerfilOpcionTile(
                icono: Icons.logout,
                titulo: 'Cerrar sesión',
                esPeligroso: true,
                onTap: () => _confirmarCerrarSesion(context),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _confirmarCerrarSesion(BuildContext context) {
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
