import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/config/menu/admin_menu_items.dart';
import 'package:go_router/go_router.dart';
import '../widgets/admin_drawer.dart'; 

class AdminShellPage extends StatelessWidget {
  final Widget child; 

  const AdminShellPage({super.key, required this.child});

  String _obtenerTitulo(BuildContext context) {
    final rutaActual = GoRouterState.of(context).uri.path;
    
    try {
      final itemActivo = menuAdminItems.firstWhere((item) => item.ruta == rutaActual);
      return itemActivo.titulo;
    } catch (e) {
      return 'Fruti Express Admin'; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_obtenerTitulo(context)),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
      ),
      drawer: const AdminDrawer(), 
      body: child, 
    );
  }
}