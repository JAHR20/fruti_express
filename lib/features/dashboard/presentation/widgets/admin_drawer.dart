import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/config/menu/admin_menu_items.dart';
import 'package:fruti_express_jahr_admin/core/widgets/confirm_dialog.dart';
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

    final currentUser = authState.user;
    final colorScheme = Theme.of(context).colorScheme;
    final String currentPath = GoRouterState.of(context).uri.path;

    return Drawer(
      backgroundColor: colorScheme.surface,
      child: Column(
        children: [
          AdminDrawerHeader(currentUser: currentUser),

          // 1. Envolvemos la lista de opciones en Expanded + ListView
          // Esto permite hacer scroll SOLO en las opciones si la pantalla es muy pequeña.
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero, // Evita un espacio blanco extra arriba
              children: menuAdminItems
                  .where((item) => item.hasPermission(currentUser))
                  .map((item) {
                    final bool isSelected = item.path == '/dashboard'
                        ? currentPath == '/dashboard'
                        : (currentPath == item.path ||
                              currentPath.startsWith('${item.path}/'));

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 3.0,
                      ),
                      child: ListTile(
                        selected: isSelected,
                        selectedTileColor: colorScheme.secondaryContainer,
                        selectedColor: colorScheme.onSecondaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        leading: Icon(
                          isSelected ? item.iconSelected : item.iconUnselected,
                        ),
                        title: Text(
                          item.title,
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        onTap: () {
                          context.pop();
                          if (!isSelected) {
                            context.go(item.path);
                          }
                        },
                      ),
                    );
                  })
                  .toList(),
            ),
          ),

          // 2. Quitamos el Spacer() porque el Expanded ya ocupa el espacio sobrante automáticamente.
          //const Divider(height: 1),

          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 12, right: 12), 
              child: ListTile(
                leading: Icon(Icons.logout, color: colorScheme.error),
                title: Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
          ),
        ],
      ),
    );
  }
}
