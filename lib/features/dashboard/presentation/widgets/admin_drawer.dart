import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/config/menu/admin_menu_items.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/presentation/widgets/admin_drawer_header.dart';
import 'package:go_router/go_router.dart';

import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthCubit>().state;
    
    if (authState is! AuthAuthenticated) return const SizedBox.shrink(); 
    
    final usuarioActual = authState.perfil;

    return Drawer(
      child: Column(
        children: [
          AdminDrawerHeader(usuarioActual: usuarioActual),
          
          ...menuAdminItems
              .where((item) => item.tienePermiso(usuarioActual)) 
              .map(
                (item) => ListTile(
                  leading: Icon(item.icono),
                  title: Text(item.titulo),
                  onTap: () {
                    context.pop();
                    context.go(item.ruta); 
                  },
                ),
              ),
          
          const Spacer(), 
          const Divider(),
          
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Cerrar Sesión', style: TextStyle(color: Colors.red)),
            onTap: () => context.read<AuthCubit>().logout(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}