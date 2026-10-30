import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/config/menu/admin_menu_items.dart';
import 'package:go_router/go_router.dart';
import '../widgets/admin_drawer.dart';

class AdminShellPage extends StatelessWidget {
  final Widget child;

  const AdminShellPage({super.key, required this.child});

  String _obtenerTitulo(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    try {
      final activeItem = menuAdminItems.firstWhere(
        (item) => item.path == '/dashboard'
            ? currentRoute == '/dashboard'
            : (currentRoute == item.path ||
                  currentRoute.startsWith('${item.path}/')),
      );
      return activeItem.title;
    } catch (e) {
      return 'Fruti Express Admin';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _obtenerTitulo(context),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const AdminDrawer(),
      body: child,
    );
  }
}
